" Custom Vim Color Scheme - Bonatto Theme
" A harmonious palette with unique colors and styles

set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Bonatto"

" Base Colors
hi Normal          guifg=#2C3E50 guibg=#FDFEFE
hi Cursor          guifg=#FDFEFE guibg=#2C3E50
hi CursorLine      guibg=#F5F7F8
hi CursorLineNr    guifg=#E67E22
hi LineNr          guifg=#BDC3C7

" Elements with Unique Styles
hi Keyword         guifg=#6155A6 gui=bold            " Bold purple
hi Comment         guifg=#7F8C8D gui=italic          " Italic gray
hi Constant        guifg=#16A085 gui=none           " Aqua green
hi Delimiter       guifg=#34495E gui=bold           " Bold dark blue
hi Identifier      guifg=#E74C3C gui=none           " Red
hi Function        guifg=#2471A3 gui=bold           " Bold blue
hi Statement       guifg=#2E86C1 gui=none           " Light blue
hi Removed         guifg=#C0392B gui=strikethrough  " Strikethrough red
hi Operator        guifg=#8E44AD gui=none           " Purple
hi MoreMsg         guifg=#27AE60 gui=bold           " Bold green
hi Macro           guifg=#D35400 gui=italic         " Italic orange
hi String          guifg=#27AE60 gui=none           " Green
hi Question        guifg=#F1C40F gui=bold           " Bold yellow
hi Todo            guifg=#9B59B6 guibg=NONE gui=bold,italic " Bold and italic purple

" Other Elements Kept from the Original Theme
hi Boolean         guifg=#B8860B
hi Conditional     guifg=#1ABC9C
hi Repeat          guifg=#D35400
hi Label           guifg=#5B2C6F
hi Exception       guifg=#CC4F4F
hi Number          guifg=#9B59B6
hi Special         guifg=#F4D03F

hi Attribute       guifg=#6155A6 gui=bold            " New
hi Constructor     guifg=#16A085 gui=bold            " New
hi Special         guifg=#D35400 gui=none            " New
hi Module          guifg=#2E86C1 gui=italic          " New
hi Symbol          guifg=#F1C40F gui=bold            " New
hi Type            guifg=#2980B9 gui=none            " New
hi Storage         guifg=#8E44AD gui=bold            " New
hi Variable        guifg=#E67E22 gui=italic          " New


" Interface Elements
hi MatchParen      guifg=#FDFEFE guibg=#3498DB
hi Search          guifg=#FDFEFE guibg=#16A085
hi VertSplit       guibg=#ECF0F1 guifg=#FDFEFE

" NERDTree
hi NERDTreeFile    guifg=#2C3E50
hi NERDTreeDir     guifg=#2E86C1
hi NERDTreeCWD     guifg=#6155A6


" " Custom Vim Color Scheme - Bonatto Theme
" " A harmonious palette with soft but readable colors
"
" set background=light
" highlight clear
" if exists("syntax_on")
"   syntax reset
" endif
" let g:colors_name = "Bonatto"
"
" " Base Colors
" " Soft off-white background to reduce visual fatigue
" hi Normal          guifg=#2C3E50 guibg=#FDFEFE
" hi Cursor          guifg=#FDFEFE guibg=#2C3E50
" hi CursorLine      guibg=#F5F7F8
" hi CursorLineNr    guifg=#E67E22
" hi LineNr          guifg=#BDC3C7
"
" " Main Syntax
" " Using a more cohesive palette of blues and greens
" hi Keyword         guifg=#6155A6
" hi Statement       guifg=#2E86C1
" hi Conditional     guifg=#1ABC9C
" hi Repeat          guifg=#D35400
" hi Label           guifg=#5B2C6F
" hi Exception       guifg=#CC4F4F
"
" " Code Elements
" " Softer but still distinct colors
" hi Boolean         guifg=#2874A6
" hi String          guifg=#27AE60
" hi Function        guifg=#2471A3
" hi Comment         guifg=#95A5A6
" hi Identifier      guifg=#E74C3C
" hi Number          guifg=#9B59B6
"
" " Other Syntax Elements
" " Keeping consistency with the main palette
" hi Constant        guifg=#16A085
" hi Special         guifg=#F4D03F
" hi Delimiter       guifg=#34495E
" hi Operator        guifg=#8E44AD
"
" " Interface Elements
" " Highlighting important elements without being too flashy
" hi Todo            guifg=#9B59B6 guibg=NONE
" hi MatchParen      guifg=#FDFEFE guibg=#3498DB
" hi Search          guifg=#FDFEFE guibg=#16A085
" hi VertSplit       guibg=#ECF0F1 guifg=#FDFEFE
"
" " NERDTree specific colors
" " Using more neutral tones for the file structure
" hi NERDTreeFile    guifg=#2C3E50
" hi NERDTreeDir     guifg=#2E86C1
" hi NERDTreeCWD     guifg=#6155A6
