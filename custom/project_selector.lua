-- jump between project directories
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local M = {}

local home = vim.loop.os_homedir()

local function make_telescope_entry(raw)
  local default_entry_prefix = "Projects"
  local max_padding = 12 -- TODO: calculate padding based on max prefix length

  if type(raw) == "table" then
    -- assume table structure is
    -- {
    -- value = "/foo/bar",          (either the absolute path to a file or directory)
    -- directory = "/foo/bar",      (the (parent) directory)
    -- display = "bar",             (the name that's displayed by telescope)
    -- prefix = "FOO" or nil,       (the prefix to the name. optional, used for categorization)
    -- ordinal = "bar" or ...       (how telescope will fuzzy find the entry)
    -- file = true or false         (whether value is a file or directory)
    -- }
    return {
      value = raw.value,
      directory = raw.file and vim.fn.fnamemodify(raw.value, ":h") or raw.value,
      display = raw.prefix
          and raw.prefix .. ":" .. string.rep(" ", max_padding - string.len(raw.prefix)) .. raw.display
        or raw.display,
      prefix = raw.prefix or nil,
      ordinal = raw.ordinal or raw.prefix .. ": " .. raw.display,
      file = raw.file or false,
    }
  else
    -- raw is a string -> treat it as a fullpath from ldr
    local fullpath = raw

    -- use :t to get the tail (basename) of the absolute path
    local basename = vim.fn.fnamemodify(fullpath, ":t")
    return {
      value = fullpath,
      directory = fullpath,
      display = default_entry_prefix
        .. ":"
        .. string.rep(" ", max_padding - string.len(default_entry_prefix))
        .. basename,
      prefix = default_entry_prefix or nil, -- useless, just for consistency
      ordinal = default_entry_prefix .. ": " .. basename,
      file = false, -- assume output of ldr is only directories
    }
  end
end

-- given a directory path, return a list of tables
local function list_subdirs_with_prefix(parent)
  local output_table = {}

  local parent_name = vim.fn.fnamemodify(parent, ":t")

  -- glob all immediate subdirectories (trailing slash ensures only dirs)
  local pattern = vim.fn.escape(parent, "\\") .. "/*/"
  local raw_list = vim.fn.glob(pattern, false, true)

  for _, dir_with_slash in ipairs(raw_list) do
    -- remove trailing slash for a clean value
    local fullpath = dir_with_slash:gsub("/$", "")

    -- get just the subdir's name (basename)
    local display = vim.fn.fnamemodify(fullpath, ":t")

    table.insert(
      output_table,
      make_telescope_entry({
        value = fullpath,
        display = display,
        prefix = parent_name,
      })
    )
  end

  return output_table
end

-- run ldr, present its output as a telescope picker, then cd into the chosen path
M.ldr_cd = function(opts)
  opts = opts or {}

  local all_entries = {}

  -- manual entries
  local config_dir = vim.fn.stdpath("config") .. "/lua/codec"
  local rc_files_dir = nil
  local last_watched_file = nil

  -- TODO: set RC directory based on user's shell
  if vim.fn.has("macunix") == 1 then
    last_watched_file = home .. "/Movies/last-watched" 
    -- if on macOS, assume using zsh
    rc_files_dir = home .. "/.zsh.d"
  elseif vim.fn.has("linux") == 1 then
    last_watched_file = home .. "/Videos/last-watched"
    -- if on linux, assume using bash
    rc_files_dir = home .. "/.bashrc.d"
  end

  table.insert(
    all_entries,
    make_telescope_entry({
      value = config_dir,
      display = "Config",
      prefix = "Neovim",
    })
  )

  if rc_files_dir ~= nil then
    table.insert(
      all_entries,
      make_telescope_entry({
        value = rc_files_dir,
        display = "RC Files",
        prefix = "Shell",
      })
    )
  end


  if last_watched_file ~= nil then
    table.insert(
      all_entries,
      make_telescope_entry({
        value = last_watched_file,
        display = "Last Watched",
        prefix = "Videos",
        file = true,
      })
    )
  end

  -- tracked project directories
  local tracked_dirs = {
    home .. "/Projects", -- projects
    home .. "/Personal", -- personal
    home .. "/Uni", -- uni
    home .. "/Work", -- work
    home .. "/Documents", -- general documents folder
    home .. "/riscv", -- riscv project
  }

  for _, dir in ipairs(tracked_dirs) do
    if vim.fn.isdirectory(dir) ~= 0 then
      for _, project_entry in ipairs(list_subdirs_with_prefix(dir)) do
        table.insert(all_entries, project_entry)
      end
    end
  end

  -- show all projects in telescope picker
  pickers
    .new(opts, {
      prompt_title = "Projects",
      finder = finders.new_table({
        results = all_entries,
        entry_maker = function(entry)
          return entry
        end,
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)

          local entry = action_state.get_selected_entry()
          if not entry or not entry.value then
            return
          end

          -- save all open and named buffers
          vim.cmd("wall")

          -- delete every buffer (including scratch / unnamed buffers)
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            -- force = true will kill even '[No Name]' (scratch) buffers
            pcall(vim.api.nvim_buf_delete, buf, { force = true })
          end

          -- set working directory
          vim.cmd("cd " .. vim.fn.fnameescape(entry.directory))

          -- either open the selected file in enter netrw
          vim.cmd(entry.file and "edit " .. vim.fn.fnameescape(entry.value) or "Ex")
        end)
        return true
      end,
    })
    :find()
end

return M
