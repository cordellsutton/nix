set relativenumber
set cursorline
syntax on
set tabstop=4





let g:mathlogic_prefix = get(g:, 'mathlogic_prefix', ';')

"function! s:ML(maplhs, char) abort
"  execute 'inoremap <silent> <buffer> ' . g:mathlogic_prefix . a:maplhs . ' ' . a:char
"endfunction

function! s:ML(maplhs, char) abort
  execute 'inoremap <silent> <buffer> ' . g:mathlogic_prefix . a:maplhs
        \ . ' <C-R>=' . string(a:char) . '<CR>'
endfunction

augroup MathLogicLean
  autocmd!
  autocmd FileType lean call s:DefineMathLogicMaps()
augroup END

function! s:DefineMathLogicMaps() abort
  call s:ML('natural',  'ℕ')
  call s:ML('integ',  'ℤ')  
  call s:ML('quot',  'ℚ')   
  call s:ML('real',  'ℝ')   
  call s:ML('comp',  'ℂ')   
  call s:ML('forall',  '∀')   
  call s:ML('exists',  '∃')   
  call s:ML('nexists', '∄')   
  call s:ML('neg',     '¬')   
  call s:ML('not',     '¬')    
  call s:ML('land',    '∧')   
  call s:ML('lor',     '∨')   
  call s:ML('to',      '→')   
  call s:ML('from',      '←')  
  call s:ML('imp',     '→')   
  call s:ML('iff',     '↔')   
  call s:ML('liff',    '↔')   
  call s:ML('top',     '⊤')   
  call s:ML('bot',     '⊥')   
  call s:ML('there4',  '∴')   
  call s:ML('because', '∵')   
  call s:ML('vDash',   '⊨')   
  call s:ML('nVdash',  '⊭')   
  call s:ML('vdash',   '⊢')   
  call s:ML('dashv',   '⊣')   
  call s:ML('models',  '⊨')   
  call s:ML('proves',  '⊢')   
  call s:ML('in',      '∈')   
  call s:ML('notin',   '∉')   
  call s:ML('ni',      '∋')   
  call s:ML('subset',  '⊆')   
  call s:ML('sub',     '⊆')   
  call s:ML('subseteq','⊆')   
  call s:ML('subsetneq','⊊')  
  call s:ML('supset',  '⊇')   
  call s:ML('supseteq','⊇')   
  call s:ML('cup',     '∪')   
  call s:ML('cap',     '∩')   
  call s:ML('empty',   '∅')   
  call s:ML('setmin',  '∖')   
  call s:ML('times',   '×')   
  call s:ML('eq',      '=')    
  call s:ML('neq',     '≠')    
  call s:ML('equiv',   '≡')    
  call s:ML('approx',  '≈')    
  call s:ML('le',      '≤')    
  call s:ML('ge',      '≥')    
  call s:ML('lt',      '<')    
  call s:ML('gt',      '>')    
  call s:ML('circ',    '∘')    
  call s:ML('cdot',    '·')    
  call s:ML('ldots',   '…')    
  call s:ML('nabla',   '∇')    
  call s:ML('prime',   '′')    
endfunction
