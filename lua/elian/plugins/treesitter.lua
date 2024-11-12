return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Importiere das nvim-treesitter Plugin
    local treesitter = require("nvim-treesitter.configs")

    -- Stelle sicher, dass der MSVC-Compiler 'zig' verwendet wird
    require("nvim-treesitter.install").compilers = { "zig" }
    treesitter.prefer_git = false

    -- Konfiguriere Treesitter
    treesitter.setup({
      -- Syntax-Highlighting aktivieren
      highlight = {
        enable = true,
      },
      -- Einrückungen aktivieren
      indent = { enable = true },
      -- Autotagging aktivieren (mit nvim-ts-autotag Plugin)
      autotag = {
        enable = true,
      },
      -- Zu installierende Parser festlegen
      ensure_installed = {
        "php",
        "html",
        "css",
        "javascript",
      },
      -- Automatische Installation fehlender Parser beim Betreten eines Puffers
      auto_install = true,
      -- Verhindert synchrone Installation von Parsern
      sync_install = false,
      -- Liste der zu ignorierenden Parser
      ignore_install = {},
      -- Inkrementelle Auswahl aktivieren
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      modules = {}, -- optional: falls keine weiteren Module benötigt werden
    })
  end,
}
