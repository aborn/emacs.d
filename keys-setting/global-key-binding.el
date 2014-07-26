(provide 'global-key-binding)
;; --------------------------------------------------------------------
;; provide all global key bindings 
;; global hot key (key binding) setting all together 
;; common key
;; "\C-" "\M-" TAB, RET, ESC, DEL "\t" "\r" "\e"
;; --------------------------------------------------------------------

;; symbol related
(global-set-key (kbd "C-*") 'flyspell-auto-correct-previous-word)
(global-set-key (kbd "C-(") 'comment-region)
(global-set-key (kbd "C-)") 'uncomment-region)

;; insert-string related
(global-set-key "\C-cd" 'insert-date)
(global-set-key "\C-cD" 'insert-current-time)
(global-set-key "\C-cm" 'insert-email-address)
(global-set-key "\C-cn" 'insert-name-english)
(global-set-key "\C-cN" 'insert-name-chinese)
(global-set-key "\C-cf" 'insert-buffer-name)
(global-set-key "\C-cl" 'switch-buffer-each-other)

;; window-dealing related.
(global-set-key "\C-ch" 'ab/window-layout-default)
(global-set-key "\C-cH" 'ab/window-layout-codeview)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


