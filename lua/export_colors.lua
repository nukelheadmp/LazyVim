local M = {}

function M.export_colors()
  -- Helper to get hex from highlight group
  local get_hl = function(name)
    local hl = vim.api.nvim_get_hl(0, { name = name })
    return {
      fg = hl.fg and string.format("#%06x", hl.fg) or nil,
      bg = hl.bg and string.format("#%06x", hl.bg) or nil,
    }
  end

  -- Get lualine section colors (e.g., a=mode, b=git, c=filename)
  local lualine_a = get_hl("lualine_a_normal") -- Mode section
  local lualine_b = get_hl("lualine_b_normal") -- Git section
  local lualine_c = get_hl("lualine_c_normal") -- Filename/path
  local statusline = get_hl("StatusLine") -- General status bg

  -- Map to our needs, prioritizing lualine’s rendered colors
  local color_map = {
    bg_dark = statusline.bg or "#1f1f28", -- Status line bg
    fg = lualine_c.fg or "#c8d3e0", -- Path/text fg
    cyan = lualine_a.fg or "#86e1fc", -- Mode/session fg
    green = lualine_b.fg or "#a4e57e", -- Git fg
    gray = get_hl("Comment").fg or "#828bb8", -- Subtle text
  }

  -- Write to shell file
  local file = io.open(os.getenv("HOME") .. "/.lazyvim_colors.sh", "w")
  if file then
    file:write("# Auto-generated LazyVim colors for " .. (vim.g.colors_name or "unknown") .. "\n")
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
