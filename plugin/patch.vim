let g:EasyMotion_use_migemo = 1

augroup EasyMotion_zh_augroup
    autocmd!
    let s:selfPath=fnamemodify(expand('<sfile>'), ':p:h')
    autocmd FuncUndefined EasyMotion#migemo#utf8#load_dict execute 'source ' . fnameescape(s:selfPath . '/../autoload/EasyMotion/migemo/utf8.vim')
    autocmd FuncUndefined EasyMotion#cmigemo#getMigemoPattern execute 'source ' . fnameescape(s:selfPath . '/../autoload/EasyMotion/cmigemo.vim')
augroup END
