-- Mango + Foot: a warm, earthy Neovim colorscheme.
-- Source palette: the user's MangoWM and Foot configurations.
-- Install as: ~/.config/nvim/colors/mango-foot.lua

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd 'highlight clear'
vim.g.colors_name = 'mango-foot'

local c = {
  bg = '#1c1b18',       -- Foot background
  root = '#201b14',     -- Mango root
  surface = '#28251f',
  surface_alt = '#312c25',
  selection = '#473629',
  border = '#4a443b',   -- Mango inactive border
  fg = '#ded5c4',       -- Foot foreground
  fg_soft = '#d4ccbc',
  fg_bright = '#f1e8d8',
  muted = '#918a7e',
  comment = '#777165',
  copper = '#c58e65',   -- Mango focused border / Foot yellow
  peach = '#e0b17c',
  split = '#f2a071',    -- Mango split indicator
  red = '#ad5a49',     -- Mango urgent border
  red_bright = '#c66a55',
  green = '#7f895b',
  green_bright = '#97a46d',
  blue = '#758693',
  blue_bright = '#91a2ad',
  purple = '#987783',
  purple_bright = '#b18b98',
  teal = '#708c85',
  teal_bright = '#8ca9a2',
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local groups = {
  -- Editor / windows
  Normal = { fg = c.fg, bg = c.bg },
  NormalNC = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.surface },
  FloatBorder = { fg = c.border, bg = c.surface },
  FloatTitle = { fg = c.copper, bg = c.surface, bold = true },
  WinSeparator = { fg = c.border, bg = c.bg },
  VertSplit = { fg = c.border },
  SignColumn = { fg = c.muted, bg = c.bg },
  FoldColumn = { fg = c.muted, bg = c.bg },
  Folded = { fg = c.muted, bg = c.surface },
  LineNr = { fg = c.comment, bg = c.bg },
  CursorLine = { bg = c.surface },
  CursorLineNr = { fg = c.copper, bg = c.surface, bold = true },
  CursorColumn = { bg = c.surface },
  ColorColumn = { bg = c.surface_alt },
  Cursor = { fg = c.bg, bg = c.copper },
  TermCursor = { reverse = true },
  Visual = { bg = c.selection },
  VisualNOS = { bg = c.selection },
  Search = { fg = c.bg, bg = c.copper },
  IncSearch = { fg = c.bg, bg = c.peach, bold = true },
  CurSearch = { fg = c.bg, bg = c.peach, bold = true },
  Substitute = { fg = c.bg, bg = c.peach },
  MatchParen = { fg = c.split, bg = c.surface_alt, bold = true },
  NonText = { fg = c.border },
  Whitespace = { fg = c.border },
  SpecialKey = { fg = c.border },
  EndOfBuffer = { fg = c.bg },
  Directory = { fg = c.blue_bright },
  Conceal = { fg = c.muted },
  Title = { fg = c.copper, bold = true },
  Question = { fg = c.green_bright },
  MoreMsg = { fg = c.green_bright },
  WarningMsg = { fg = c.peach },
  ErrorMsg = { fg = c.red_bright, bold = true },
  QuickFixLine = { bg = c.selection },

  -- Popup menus, completion and tabs
  Pmenu = { fg = c.fg, bg = c.surface },
  PmenuSel = { fg = c.fg_bright, bg = c.selection, bold = true },
  PmenuSbar = { bg = c.surface_alt },
  PmenuThumb = { bg = c.border },
  PmenuMatch = { fg = c.copper, bold = true },
  PmenuMatchSel = { fg = c.peach, bg = c.selection, bold = true },
  StatusLine = { fg = c.fg, bg = c.surface_alt },
  StatusLineNC = { fg = c.muted, bg = c.surface },
  TabLine = { fg = c.muted, bg = c.surface },
  TabLineFill = { bg = c.surface },
  TabLineSel = { fg = c.bg, bg = c.copper, bold = true },
  WildMenu = { fg = c.bg, bg = c.copper },

  -- Classic syntax highlighting (also used as fallbacks)
  Comment = { fg = c.comment, italic = true },
  Constant = { fg = c.purple_bright },
  String = { fg = c.green_bright },
  Character = { fg = c.green_bright },
  Number = { fg = c.purple_bright },
  Boolean = { fg = c.purple_bright, bold = true },
  Float = { fg = c.purple_bright },
  Identifier = { fg = c.fg },
  Function = { fg = c.blue_bright },
  Statement = { fg = c.copper },
  Conditional = { fg = c.copper },
  Repeat = { fg = c.copper },
  Label = { fg = c.peach },
  Operator = { fg = c.fg_soft },
  Keyword = { fg = c.copper },
  Exception = { fg = c.red_bright },
  PreProc = { fg = c.teal_bright },
  Include = { fg = c.teal_bright },
  Define = { fg = c.teal_bright },
  Macro = { fg = c.teal_bright },
  Type = { fg = c.peach },
  StorageClass = { fg = c.copper },
  Structure = { fg = c.peach },
  Typedef = { fg = c.peach },
  Special = { fg = c.split },
  SpecialChar = { fg = c.split },
  Delimiter = { fg = c.muted },
  Underlined = { fg = c.teal_bright, underline = true },
  Todo = { fg = c.bg, bg = c.peach, bold = true },
  Error = { fg = c.red_bright, bold = true },

  -- Diffs and diagnostics
  DiffAdd = { fg = c.green_bright, bg = '#292e24' },
  DiffChange = { fg = c.blue_bright, bg = '#292c2e' },
  DiffDelete = { fg = c.red_bright, bg = '#342721' },
  DiffText = { fg = c.peach, bg = c.selection },
  DiagnosticError = { fg = c.red_bright },
  DiagnosticWarn = { fg = c.peach },
  DiagnosticInfo = { fg = c.blue_bright },
  DiagnosticHint = { fg = c.teal_bright },
  DiagnosticOk = { fg = c.green_bright },
  DiagnosticUnderlineError = { undercurl = true, sp = c.red_bright },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.peach },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue_bright },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.teal_bright },
  SpellBad = { undercurl = true, sp = c.red_bright },
  SpellCap = { undercurl = true, sp = c.blue_bright },
  SpellRare = { undercurl = true, sp = c.purple_bright },
  SpellLocal = { undercurl = true, sp = c.teal_bright },
}

for group, opts in pairs(groups) do
  hl(group, opts)
end

-- Tree-sitter captures and LSP semantic tokens
local links = {
  ['@comment'] = 'Comment',
  ['@string'] = 'String',
  ['@string.escape'] = 'SpecialChar',
  ['@string.special'] = 'SpecialChar',
  ['@character'] = 'Character',
  ['@number'] = 'Number',
  ['@number.float'] = 'Float',
  ['@boolean'] = 'Boolean',
  ['@constant'] = 'Constant',
  ['@constant.builtin'] = 'Constant',
  ['@variable'] = 'Identifier',
  ['@variable.builtin'] = 'Special',
  ['@variable.parameter'] = 'Identifier',
  ['@variable.member'] = 'Identifier',
  ['@property'] = 'Identifier',
  ['@function'] = 'Function',
  ['@function.call'] = 'Function',
  ['@function.builtin'] = 'Function',
  ['@function.method'] = 'Function',
  ['@function.method.call'] = 'Function',
  ['@constructor'] = 'Type',
  ['@type'] = 'Type',
  ['@type.builtin'] = 'Type',
  ['@type.definition'] = 'Type',
  ['@module'] = 'Include',
  ['@keyword'] = 'Keyword',
  ['@keyword.function'] = 'Keyword',
  ['@keyword.return'] = 'Keyword',
  ['@keyword.operator'] = 'Operator',
  ['@keyword.import'] = 'Include',
  ['@keyword.exception'] = 'Exception',
  ['@operator'] = 'Operator',
  ['@punctuation.delimiter'] = 'Delimiter',
  ['@punctuation.bracket'] = 'Delimiter',
  ['@tag'] = 'Type',
  ['@tag.attribute'] = 'Identifier',
  ['@attribute'] = 'PreProc',
  ['@markup.heading'] = 'Title',
  ['@markup.link'] = 'Underlined',
  ['@markup.link.url'] = 'Underlined',
  ['@markup.raw'] = 'String',
  ['@markup.list'] = 'Special',
  ['@markup.strong'] = 'Bold',
  ['@markup.italic'] = 'Italic',
  ['@lsp.type.function'] = 'Function',
  ['@lsp.type.method'] = 'Function',
  ['@lsp.type.variable'] = 'Identifier',
  ['@lsp.type.parameter'] = 'Identifier',
  ['@lsp.type.property'] = 'Identifier',
  ['@lsp.type.class'] = 'Type',
  ['@lsp.type.struct'] = 'Type',
  ['@lsp.type.interface'] = 'Type',
  ['@lsp.type.enum'] = 'Type',
  ['@lsp.type.type'] = 'Type',
  ['@lsp.type.keyword'] = 'Keyword',
  ['@lsp.type.string'] = 'String',
  ['@lsp.type.number'] = 'Number',
  ['@lsp.type.macro'] = 'Macro',
}

hl('Bold', { bold = true })
hl('Italic', { italic = true })
for group, target in pairs(links) do
  hl(group, { link = target })
end

-- Kickstart plugins: Telescope, blink.cmp, Mini, Oil, Gitsigns, Which-key
local plugin_groups = {
  TelescopeNormal = { fg = c.fg, bg = c.surface },
  TelescopeBorder = { fg = c.border, bg = c.surface },
  TelescopePromptNormal = { fg = c.fg, bg = c.surface_alt },
  TelescopePromptBorder = { fg = c.copper, bg = c.surface_alt },
  TelescopePromptTitle = { fg = c.bg, bg = c.copper, bold = true },
  TelescopeResultsTitle = { fg = c.copper, bg = c.surface },
  TelescopePreviewTitle = { fg = c.green_bright, bg = c.surface },
  TelescopeSelection = { fg = c.fg_bright, bg = c.selection, bold = true },
  TelescopeSelectionCaret = { fg = c.copper, bg = c.selection },
  TelescopeMatching = { fg = c.peach, bold = true },
  TelescopePromptPrefix = { fg = c.copper },
  TelescopeResultsDiffAdd = { fg = c.green_bright },
  TelescopeResultsDiffChange = { fg = c.blue_bright },
  TelescopeResultsDiffDelete = { fg = c.red_bright },

  BlinkCmpMenu = { fg = c.fg, bg = c.surface },
  BlinkCmpMenuBorder = { fg = c.border, bg = c.surface },
  BlinkCmpMenuSelection = { fg = c.fg_bright, bg = c.selection },
  BlinkCmpLabel = { fg = c.fg },
  BlinkCmpLabelMatch = { fg = c.copper, bold = true },
  BlinkCmpLabelDetail = { fg = c.muted },
  BlinkCmpLabelDescription = { fg = c.muted },
  BlinkCmpSource = { fg = c.teal_bright },
  BlinkCmpDoc = { fg = c.fg, bg = c.surface },
  BlinkCmpDocBorder = { fg = c.border, bg = c.surface },
  BlinkCmpSignatureHelp = { fg = c.fg, bg = c.surface },
  BlinkCmpSignatureHelpBorder = { fg = c.border, bg = c.surface },
  BlinkCmpKindFunction = { fg = c.blue_bright },
  BlinkCmpKindMethod = { fg = c.blue_bright },
  BlinkCmpKindVariable = { fg = c.fg },
  BlinkCmpKindClass = { fg = c.peach },
  BlinkCmpKindStruct = { fg = c.peach },
  BlinkCmpKindInterface = { fg = c.peach },
  BlinkCmpKindKeyword = { fg = c.copper },
  BlinkCmpKindSnippet = { fg = c.purple_bright },
  BlinkCmpKindText = { fg = c.fg_soft },

  MiniStatuslineModeNormal = { fg = c.bg, bg = c.copper, bold = true },
  MiniStatuslineModeInsert = { fg = c.bg, bg = c.green_bright, bold = true },
  MiniStatuslineModeVisual = { fg = c.bg, bg = c.purple_bright, bold = true },
  MiniStatuslineModeReplace = { fg = c.bg, bg = c.red_bright, bold = true },
  MiniStatuslineModeCommand = { fg = c.bg, bg = c.blue_bright, bold = true },
  MiniStatuslineModeOther = { fg = c.bg, bg = c.teal_bright, bold = true },
  MiniStatuslineDevinfo = { fg = c.fg, bg = c.surface_alt },
  MiniStatuslineFilename = { fg = c.fg_soft, bg = c.surface },
  MiniStatuslineFileinfo = { fg = c.fg, bg = c.surface_alt },
  MiniStatuslineInactive = { fg = c.muted, bg = c.surface },

  OilDir = { fg = c.blue_bright, bold = true },
  OilDirIcon = { fg = c.blue_bright },
  OilLink = { fg = c.teal_bright },
  OilOrphanLink = { fg = c.red_bright },
  OilHidden = { fg = c.comment },
  OilDirHidden = { fg = c.comment },

  GitSignsAdd = { fg = c.green_bright },
  GitSignsChange = { fg = c.blue_bright },
  GitSignsDelete = { fg = c.red_bright },
  GitSignsCurrentLineBlame = { fg = c.comment, italic = true },
  WhichKey = { fg = c.copper },
  WhichKeyGroup = { fg = c.blue_bright },
  WhichKeyDesc = { fg = c.fg },
  WhichKeySeparator = { fg = c.comment },
  WhichKeyFloat = { bg = c.surface },
  FidgetTitle = { fg = c.copper, bold = true },
  FidgetTask = { fg = c.muted },
}

for group, opts in pairs(plugin_groups) do
  hl(group, opts)
end

-- Let Neovim terminal buffers share Foot's exact 16 ANSI colors.
local ansi = {
  '#1c1b18', '#ad5a49', '#7f895b', '#c58e65',
  '#758693', '#987783', '#708c85', '#d4ccbc',
  '#625e55', '#c66a55', '#97a46d', '#e0b17c',
  '#91a2ad', '#b18b98', '#8ca9a2', '#f1e8d8',
}
for i, color in ipairs(ansi) do
  vim.g['terminal_color_' .. (i - 1)] = color
end
