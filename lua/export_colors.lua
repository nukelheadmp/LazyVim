local M = {}

function M.export_colors()
  -- Try to get theme-specific colors (e.g., tokyonight)
  local colors = {}
  local theme = vim.g.colors_name or "tokyonight"
  if theme == "tokyonight" then
    colors = require("tokyonight.colors").setup()
  elseif theme == "catppuccin" then
    colors = require("catppuccin.palettes").get_palette()
  -- Add other themes as needed
  else
    colors = { bg_dark = "#1a1b26", fg = "#a9b1d6", cyan = "#7dcfff", green = "#9ece6a", gray = "#6c7086" }
  end

  -- Map to LazyVim-like names, ensuring lualine-like usage
  local color_map = {
    bg_dark = colors.bg_dark or "#1a1b26", -- Main background
    fg = colors.fg or "#a9b1d6", -- Default text
    cyan = colors.cyan or "#7dcfff", -- Accent (e.g., mode, session)
    green = colors.green or "#9ece6a", -- Git or secondary accent
    gray = colors.gray or "#6c7086", -- Subtle text
  }

  -- Write to shell file
  local file = io.open(os.getenv("HOME") .. "/.lazyvim_colors.sh", "w")
  if file then
    file:write("# Auto-generated LazyVim colors\n")
    for name, value in pairs(color_map) do
      file:write(string.format("export LAZYVIM_%s='%s'\n", name:upper(), value))
    end
    file:close()
    print("Colors exported to ~/.lazyvim_colors.sh")
  else
    print("Failed to write color file")
  end
end

vim.api.nvim_create_user_command("ExportColors", M.export_colors, {})
return M
