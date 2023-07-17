-- It is usefull to use :checkhealth whichkey

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<CR>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>", "z", "<c-w>"}, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  ["<leader>"] = {
    b = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
      "Buffers",
    },
    w = { "<cmd>w!<CR>", "Save" },
    -- q = { "<cmd>q!<CR>", "Quit" },
    c = { "<cmd>bd!<CR>", "Delete Buffer" }, -- Closes the window
    -- h = { "<cmd>nohlsearch<CR>", "No Highlight" },
    d = {
      name = "Debug",
      d = { ":w<CR> <bar> :lua require'dap'.continue()<CR>", "Init" },
      l = { ":w<CR> <bar> :lua require'dap'.run_last()<CR>", "Run last" },
      q = { ":bd! dap-repl<CR> <bar> :lua require('dapui').close()<CR> <bar> :lua require'dap'.disconnect()<CR> <bar> :lua require'dap'.close()<CR>", "Quit" },
      b = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
      B = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Toggle conditional breakpoint" },
      r = { ":lua require'dap'.repl.toggle()<CR>", "Toggle REPL" },
      j = { ":lua require'dap'.down()<CR>", "Down" },
      k = { ":lua require'dap'.up()<CR>", "Up" },
      o = { ":lua require'dap'.step_over()<CR>", "Step over" },
      i = { ":lua require'dap'.step_into()<CR>", "Step into" },
      O = { ":lua require'dap'.step_out()<CR>", "Step out" },

      a = { ":lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Diagnostic"},
      Q = { ":lua vim.diagnostic.setloclist()<CR>", "Error list" },
      U = { ":lua require('dapui').toggle()<CR>", "Toggle UI" },
      e = { ":lua require'dapui'.eval()<CR> ", "Eval" },
      s = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "Debug selection" },
    },

    e = { "<cmd> Telescope file_browser<CR>", "File Browser" },

    f = {
      name = "Find",
      e = { "<cmd> Telescope file_browser<CR>", "File Browser" },
      f = { "<cmd> Telescope find_files hidden=true no_ignore=true<CR>", "Find File" },
      g = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
      h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
      r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
      p = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },
      n = { "<cmd>enew<CR>", "New File" },
    },

    g = {
      name = "Git",
      g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
      d = {
        "<cmd>Gitsigns diffthis HEAD<CR>",
        "Diff",
      },
    },

    h = {"<cmd>sp<CR>", "Vertical Split"},

    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>Telescope lsp_document_diagnostics<CR>", "Document Diagnostics" },
      w = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Workspace Diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format{async=true}<CR>", "Format" },
      i = { "<cmd>LspInfo<CR>", "Info" },
      I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
      j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
      k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
      l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols"},
    },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<CR>", "Compile" },
      i = { "<cmd>PackerInstall<CR>", "Install" },
      s = { "<cmd>PackerSync<CR>", "Sync" },
      S = { "<cmd>PackerStatus<CR>", "Status" },
      u = { "<cmd>PackerUpdate<CR>", "Update" },
    },

    r = {"<cmd>lua vim.lsp.buf.rename()<CR>" ,"rename" },

    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
      C = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
      c = { "<cmd>Telescope commands<CR>", "Commands" },
      m = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
      r = { "<cmd>Telescope registers<CR>", "Registers" },
      k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    },

    v = {"<cmd>vs<CR>", "Vertical Split"},
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)

