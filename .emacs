;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emaca basic setting only for version 23
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/custom/")
(setq display-time-day-and-date t)
(display-time)
(define-key global-map "\C-x\C-g" 'goto-line)
(global-linum-mode t)
(setq linum-format "%4d \u2502")
(setq frame-title-format "--love cld--emacs@%b")   
(global-set-key "\C-x\C-p" 'previous-buffer)
(global-set-key "\C-x\C-n" 'next-buffer)
(global-set-key "\C-x\C-j" 'erase-buffer)
(global-set-key "\C-x\C-k" 'kill-buffer) 
;;(global-set-key [?\C-,] 'switch-to-prev-buffer)  ;; emacs 24
;;(global-set-key [?\C-.] 'switch-to-next-buffer)  ;; emacs 24
(global-set-key "\C-i" 'just-one-space)
(global-set-key "\C-o" 'other-window)

; --------------------------------------------------------------------
; set color-theme, pls download color-theme.el form
; from http://nongnu.askapache.com//color-theme/color-theme-6.6.0.zip
; then unzip this file into ~/.emacs.d/site-lisp/
; --------------------------------------------------------------------
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn 
     (color-theme-initialize)
     (color-theme-hober)))
;;(color-theme-dark-green)   

; --------------------------------------------------------------------
; set copy a whole line by key binding
; --------------------------------------------------------------------
(load-file "~/.emacs.d/site-lisp/custom/copy-line.el")
(global-set-key "\C-x\C-k" 'copy-line)

; --------------------------------------------------------------------
; column-marker.el and fill-column-indicator.el setting
; --------------------------------------------------------------------
(require 'column-marker)
(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))    
(global-set-key [?\C-x ?m] 'column-marker-1)
(global-set-key [?\C-x ?n] 'column-marker-3)
(require 'fill-column-indicator)  
(setq fci-rule-width 2)  
(setq fci-rule-color "yellow")  
(setq fci-rule-column 80)  
(define-globalized-minor-mode   
  global-fci-mode fci-mode (lambda () (fci-mode 1)))  
(global-fci-mode 1)  


