(provide 'global-key-binding)
;; --------------------------------------------------------------------
;; provide all global key bindings 
;; global hot key (key binding) setting all together 
;; common key
;; "\C-" "\M-" TAB, RET, ESC, DEL "\t" "\r" "\e"
;; --------------------------------------------------------------------

;; M-s .. is unused, used for future.
(define-key global-map "\C-x\C-g" 'goto-line)
(global-set-key "\C-x\C-p" 'previous-buffer)
(global-set-key (kbd "C-,") 'previous-buffer)       ; emacs 23
(global-set-key "\C-x\C-n" 'next-buffer)
(global-set-key (kbd "C-.") 'next-buffer)           ; emacs 23
(global-set-key "\C-x\C-j" 'erase-buffer)
;; (global-set-key "\C-xk" 'kill-buffer)            ; emacs built-in key
(global-set-key "\C-x\C-r" 'revert-buffer)
(global-set-key "\C-x\C-m" 'indent-region)
(global-set-key (kbd "M-n") 'set-mark-command)
(global-set-key "\C-x\C-l" 'copy-one-line)
(global-set-key "\C-i" 'just-one-space)
(global-set-key "\C-o" 'other-window)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key "\C-x\C-e" 'eval-current-buffer)
(global-set-key (kbd "C-'") 'move-middle-of-line)
(global-set-key (kbd "C-;") 'move-forward-by-five)
(global-set-key (kbd "C-:") 'move-backward-by-five)
(global-set-key (kbd "<C-tab>") 'bury-buffer)         ; switch buffer C-tab
(global-set-key (kbd "M-m") 'ab/switch-to-shell-buffer)  ; function in switch-swift
(global-set-key (kbd "M-c") 'call-last-kbd-macro)
(global-set-key (kbd "C-j") 'switch-to-buffer)
(global-set-key (kbd "M-j") 'find-file)
(global-set-key "\C-c\C-k" 'start-kbd-macro)
(global-set-key "\C-c\C-l" 'end-kbd-macro)

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


