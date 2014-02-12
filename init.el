;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emaca basic setting only for version 23 and later version
;; put this file (init.el) in ~/.emacs.d/
;; ~/.emacs.d/init.el equals to ~/.emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/site-lisp/wubi")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0/")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/custom/")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/iemacsfun/")

;; (load-file "~/.emacs.d/site-lisp/custom/copy-line.el")
;; (load-file "~/.emacs.d/site-lisp/iemacsfun/move-middle-of-line.el")
;; (require 'load-directory)
;; (load-directory "~/.emacs.d/site-lisp/iemacsfun/")

;; --------------------------------------------------------------------
;; add require features defined by myself
;; --------------------------------------------------------------------
(require 'copy-line)
(require 'move-swift)

;; --------------------------------------------------------------------
;; set indent
;; --------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
;; (customize-variable (quote tab-stop-list))

;; --------------------------------------------------------------------;
;; add follwing code to keep *shell* in middle using
;;    C-l C-l
;; --------------------------------------------------------------------;
(remove-hook 'comint-output-filter-functions 
			 'comint-postoutput-scroll-to-bottom)

;; --------------------------------------------------------------------
;; basic setting for emacs and mode turn on or off
;; --------------------------------------------------------------------
(custom-set-variables
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64))))
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
                                    ; max frame when launch emacs GUI
(setq display-time-day-and-date t)
(setq inhibit-startup-message t)
(require 'hl-line)                  ; highlight current line
(global-hl-line-mode t)             ; setting as global hl

(display-time)
(show-paren-mode t)
(column-number-mode t)              ; show column number
(global-auto-revert-mode t) 
(global-linum-mode t)
(setq linum-format "%4d \u2502")            ; for GUI and command line emacs 24
;(setq linum-format "%4d |")                ; for command line emacs 23
(setq frame-title-format "--love cld--emacs@%b")   
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (kill-buffer "*scratch*")
(find-file "~/.emacs.d/init.el")    ; initial open init.el file

;; --------------------------------------------------------------------
;; hot key (key binding) setting all together
;; --------------------------------------------------------------------
(define-key global-map "\C-x\C-g" 'goto-line)
(global-set-key "\C-x\C-p" 'previous-buffer)
(global-set-key (kbd "C-,") 'previous-buffer)       ; emacs 23
;; (global-set-key [?\C-,] 'switch-to-prev-buffer)  ; emacs 24
(global-set-key "\C-x\C-n" 'next-buffer)
(global-set-key (kbd "C-.") 'next-buffer)           ; emacs 23
;; (global-set-key [?\C-.] 'switch-to-next-buffer)  ; emacs 24
(global-set-key "\C-x\C-j" 'erase-buffer)
(global-set-key "\C-x\C-k" 'kill-buffer)
(global-set-key "\C-x\C-r" 'revert-buffer)
(global-set-key "\C-x\C-m" 'indent-region)
(global-set-key (kbd "M-n") 'set-mark-command)
(global-set-key "\C-x\C-l" 'copy-line)
(global-set-key "\C-i" 'just-one-space)
(global-set-key "\C-o" 'other-window)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key "\C-x\C-e" 'eval-current-buffer)
(global-set-key (kbd "C-'") 'move-middle-of-line)
(global-set-key (kbd "C-;") 'move-forward-by-five)
(global-set-key (kbd "C-:") 'move-backward-by-five)
(global-set-key (kbd "<C-tab>") 'bury-buffer)       ; switch buffer C-tab

;; --------------------------------------------------------------------
;; By an unknown contributor, move-cursor to matched bracket
;; --------------------------------------------------------------------
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; --------------------------------------------------------------------
;; from http://nongnu.askapache.com//color-theme/color-theme-6.6.0.zip
;; then unzip this file into ~/.emacs.d/site-lisp/
;; --------------------------------------------------------------------
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)			
(color-theme-robin-hood)
(eval-after-load "color-theme" 
  (if window-system  
      '(color-theme-subtle-hacker)  ;; GUI mode
    '(color-theme-tty-dark)))       ;; Command line mode

;;(color-theme-dark-green)          ;; other options
;;(color-theme-billw)               ;; other options
;;(Color-theme-subtle-hacker)       ;; this for GUI, or color-theme-select
;;(color-theme-tty-dark)            ;; this for command line mode

;; --------------------------------------------------------------------
;; column-marker.el and fill-column-indicator.el setting
;; --------------------------------------------------------------------
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emace auto-complete version 1.3.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/ac-dict")
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set c/c++ mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 4
      indent-tabs-mode t)
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set markdown-mode download from 
;;                    http://jblevins.org/projects/markdown-mode/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/site-lisp/custom/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install cedet and add speedbar download from 
;;     http://www.emacswiki.org/emacs/sr-speedbar.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cedet)
(global-ede-mode t)
;;(global-ede-mode 1)
(require 'semantic/sb)
(require 'semantic/ia)
(semantic-mode 1)
(require 'sr-speedbar)
(global-set-key (kbd "C-x C-y") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)  ;; nil means speedbar appears on left
(setq sr-speedbar-skip-other-window-p t)
(setq speedbar-show-unknown-files t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add undo-tree download from, C-x u to shows undo-tree graph
;;                         http://www.dr-qubit.org/undo-tree/undo-tree.el 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'undo-tree)
(global-undo-tree-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add matlab mode, this setting from 
;;              http://www.emacswiki.org/emacs/MatlabMod
;; code download from http://download.csdn.net/detail/loveaborn/6814809
;; or http://matlab-emacs.cvs.sourceforge.net/viewvc/matlab-emacs/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/matlab-emacs")    ; matlab.el path
(add-to-list 'load-path "/usr/matlab/bin/matlab")               ; matlab path
(require 'matlab-load)
(autoload 'run-octave "octave-inf" nil t)                       ; special
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

(setq matlab-indent-function-body t)    ; if you want function bodies indented
(setq matlab-verify-on-save-flag nil)   ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq fill-column 80))		        ; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
  '())
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
(global-font-lock-mode t)
                                        ;  To get hilit19 support try adding:
(require 'tlc)
(autoload 'tlc-mode "tlc" "tlc Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.tlc$" . tlc-mode))
(setq tlc-indent-function t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add php-mode download from
;;    http://www.emacswiki.org/emacs/download/php-mode-improved.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add web-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  add session.el and desptop setting
;;  download from http://emacs-session.sourceforge.net/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
	  (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

;;------------------------------------------------------------------------------
;; add chinese wubi input method to emacs
;; url:daiyuwen.freeshell.org/gb/wubi/wubi.html 
;;------------------------------------------------------------------------------
(require 'wubi)
(wubi-load-local-phrases) ;add user's wubi phrases
(register-input-method "chinese-wubi" "Chinese-GB" 'quail-use-package
                       "WuBi" "WuBi"
                       "wubi") 
(setq default-input-method "chinese-wubi")
(define-key global-map "\C-c\C-j" 'toggle-input-method)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; last modified by Aborn Jiang (aborn.jiang@gmail.com) at 2014-01-25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
