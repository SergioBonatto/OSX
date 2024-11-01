" Custom Vim Color Scheme - Bonatto Theme
" Uma paleta harmoniosa com cores e estilos únicos

set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "Bonatto"

" Cores Base
hi Normal          guifg=#2C3E50 guibg=#FDFEFE
hi Cursor          guifg=#FDFEFE guibg=#2C3E50
hi CursorLine      guibg=#F5F7F8
hi CursorLineNr    guifg=#E67E22
hi LineNr          guifg=#BDC3C7

" Elementos com Estilos Únicos
hi Keyword         guifg=#6155A6 gui=bold            " Roxo negrito
hi Comment         guifg=#7F8C8D gui=italic          " Cinza itálico
hi Constant        guifg=#16A085 gui=none           " Verde água
hi Delimiter       guifg=#34495E gui=bold           " Azul escuro negrito
hi Identifier      guifg=#E74C3C gui=none           " Vermelho
hi Function        guifg=#2471A3 gui=bold           " Azul negrito
hi Statement       guifg=#2E86C1 gui=none           " Azul claro
hi Removed         guifg=#C0392B gui=strikethrough  " Vermelho riscado
hi Operator        guifg=#8E44AD gui=none           " Roxo
hi MoreMsg         guifg=#27AE60 gui=bold           " Verde negrito
hi Macro           guifg=#D35400 gui=italic         " Laranja itálico
hi String          guifg=#27AE60 gui=none           " Verde
hi Question        guifg=#F1C40F gui=bold           " Amarelo negrito
hi Todo            guifg=#9B59B6 guibg=NONE gui=bold,italic " Roxo negrito e itálico

" Outros Elementos Mantidos do Tema Original
hi Boolean         guifg=#B8860B
hi Conditional     guifg=#1ABC9C
hi Repeat          guifg=#D35400
hi Label           guifg=#5B2C6F
hi Exception       guifg=#CC4F4F
hi Number          guifg=#9B59B6
hi Special         guifg=#F4D03F

hi Attribute       guifg=#6155A6 gui=bold            " Novo
hi Constructor     guifg=#16A085 gui=bold            " Novo
hi Special         guifg=#D35400 gui=none            " Novo
hi Module          guifg=#2E86C1 gui=italic          " Novo
hi Symbol          guifg=#F1C40F gui=bold            " Novo
hi Type            guifg=#2980B9 gui=none            " Novo
hi Storage         guifg=#8E44AD gui=bold            " Novo
hi Variable        guifg=#E67E22 gui=italic          " Novo


" Elementos de Interface
hi MatchParen      guifg=#FDFEFE guibg=#3498DB
hi Search          guifg=#FDFEFE guibg=#16A085
hi VertSplit       guibg=#ECF0F1 guifg=#FDFEFE

" NERDTree
hi NERDTreeFile    guifg=#2C3E50
hi NERDTreeDir     guifg=#2E86C1
hi NERDTreeCWD     guifg=#6155A6


" " Custom Vim Color Scheme - Bonatto Theme
" " Uma paleta harmoniosa com cores suaves mas legíveis
"
" set background=light
" highlight clear
" if exists("syntax_on")
"   syntax reset
" endif
" let g:colors_name = "Bonatto"
"
" " Cores Base
" " Background suave em tom off-white para reduzir fadiga visual
" hi Normal          guifg=#2C3E50 guibg=#FDFEFE
" hi Cursor          guifg=#FDFEFE guibg=#2C3E50
" hi CursorLine      guibg=#F5F7F8
" hi CursorLineNr    guifg=#E67E22
" hi LineNr          guifg=#BDC3C7
"
" " Sintaxe Principal
" " Usando uma paleta mais coesa de azuis e verdes
" hi Keyword         guifg=#6155A6
" hi Statement       guifg=#2E86C1
" hi Conditional     guifg=#1ABC9C
" hi Repeat          guifg=#D35400
" hi Label           guifg=#5B2C6F
" hi Exception       guifg=#CC4F4F
"
" " Elementos de Código
" " Cores mais suaves mas ainda distintas
" hi Boolean         guifg=#2874A6
" hi String          guifg=#27AE60
" hi Function        guifg=#2471A3
" hi Comment         guifg=#95A5A6
" hi Identifier      guifg=#E74C3C
" hi Number          guifg=#9B59B6
"
" " Outros Elementos de Sintaxe
" " Mantendo consistência com a paleta principal
" hi Constant        guifg=#16A085
" hi Special         guifg=#F4D03F
" hi Delimiter       guifg=#34495E
" hi Operator        guifg=#8E44AD
"
" " Elementos de Interface
" " Destacando elementos importantes sem serem muito chamativos
" hi Todo            guifg=#9B59B6 guibg=NONE
" hi MatchParen      guifg=#FDFEFE guibg=#3498DB
" hi Search          guifg=#FDFEFE guibg=#16A085
" hi VertSplit       guibg=#ECF0F1 guifg=#FDFEFE
"
" " Cores específicas para NERDTree
" " Usando tons mais neutros para a estrutura de arquivos
" hi NERDTreeFile    guifg=#2C3E50
" hi NERDTreeDir     guifg=#2E86C1
" hi NERDTreeCWD     guifg=#6155A6
