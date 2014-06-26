;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; emacs basic setting only for version 23 and later version         
;; put this file (init.el) in ~/.emacs.d/                            
;; NOTE: ~/.emacs.d/init.el equals to ~/.emacs                       
;; You are advised to use emacs 24.3+                                
;; More detail information refers to README.md                       
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/site-lisp/wubi")
(add-to-list 'load-path "~/.emacs.d/keys-setting/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/old-emacs-package/")
(add-to-list 'load-path "~/.emacs.d/local/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/modules/")
(add-to-list 'load-path "~/.emacs.d/utils/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex-11.87")
(add-to-list 'load-path "~/.emacs.d/elpa/company-0.8.0")
;; (require 'load-directory)
;; (load-directory "~/.emacs.d/utils/")

;; --------------------------------------------------------------------
;; setting exec-path, which like terminal's PATH variable
;; --------------------------------------------------------------------
(add-to-list 'exec-path "/usr/local/racket/bin")

;; --------------------------------------------------------------------
;; add require features defined by myself
;; --------------------------------------------------------------------
(require 'shell-dealing)
(require 'copy-line)
(require 'move-swift)
(require 'emacs-nifty-tricks)
(require 'insert-string)
(require 'buffer-dealing)
(require 'window-dealing)
(require 'quick-file-jump)
(require 'ab-help)
(require 'latex-dealing)
(require 'run-scripts)
;; -----------------------------------------------------------------------------
;; key binding, all files are in ~/.emacs.d/keys-setting
;; -----------------------------------------------------------------------------
;;(require 'global-key-binding)            ; global key binding
;;(require 'major-mode-binding)            ; local major mode key binding


;; --------------------------------------------------------------------
;; set indent
;; --------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
;;(setq max-lisp-eval-depth 3000)      ;; default 500
;;(setq max-specpdl-size 3000)         ;; default 1000

;; --------------------------------------------------------------------;
;; add follwing code to keep *shell* in middle using
;;    C-l C-l
;; --------------------------------------------------------------------;
(remove-hook 'comint-output-filter-functions 
			 'comint-postoutput-scroll-to-bottom)

;; --------------------------------------------------------------------;
;; custom-set-variables, which are produced by system.
;; --------------------------------------------------------------------;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("*shell*") ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*" . t) ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*"))))
 '(ecb-layout-name "left8")
 '(ecb-layout-window-sizes (quote (("left8" (0.8 . 1.0)))))
 ;; '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-prescan-directories-for-emptyness t)
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-sources-menu-user-extension-function (quote ignore))
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-width 0.175)
 '(ecb-non-semantic-exclude-modes (quote (scheme-mode fundamental-mode text-mode)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(session-use-package t nil (session))
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64))))
(put 'erase-buffer 'disabled nil)

;; --------------------------------------------------------------------
;; basic setting for emacs and mode turn on or off when boot up
;; --------------------------------------------------------------------
;; max frame when launch emacs GUI
(setq inhibit-startup-message t)
(require 'hl-line)                  ; highlight current line
(global-hl-line-mode t)             ; setting as global hl
(setq x-select-enable-clipboard t)  ; copy and paste with other program

(show-paren-mode t)                 ; paren match show
(column-number-mode t)              ; show column number
(global-auto-revert-mode t) 
(global-linum-mode t)               ; show line number
(setq linum-format "%4d \u2502")    ; for GUI and command line emacs 24
;; (setq linum-format "%4d |")      ; for command line emacs 23
(setq frame-title-format '("%b (%f) &aborn love cld&  [%s] emacs" emacs-version))   
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'flyspell-mode)
(flyspell-prog-mode)                ; flyspell mode for comments & strings only

;; (kill-buffer "*scratch*")
(find-file "~/.emacs.d/init.el")    ; initial open init.el file 
(unless (get-buffer "*shell*")
  (shell))                          ; open shell when boot up 

;; --------------------------------------------------------------------
;;  mode line setting
;; --------------------------------------------------------------------
(display-time)
(setq display-time-24hr-format t)
(setq display-time-use-mail-icon t)
(setq display-time-day-and-date t)

;; --------------------------------------------------------------------
;; setting org-mode
;; --------------------------------------------------------------------
;; (setq org-todo-keywords
;; '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
(setq org-todo-keywords
	  '((sequence "TODO" "ONGOING" "DONE" "DELEGATED")))
(setq org-log-done 'time)   ;;  setting close time
(setq org-log-done 'note)   ;;  setting a log note
;; (set org-modules 'habits)

(require 'basic-key-binding)
;; setting color-theme
(require 'dream-theme)
(setq highlight-tail-colors '(("black" . 0)
							  ("#bc2525" . 25)
							  ("black" . 66)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; begin module settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; --------------------------------------------------------------------
;; By an unknown contributor, move-cursor to matched bracket
;; The hot-key binding to %
;; --------------------------------------------------------------------
(global-set-key "%" 'match-paren)
(defun match-paren (arg)				
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; --------------------------------------------------------------------
;; column-marker.el and fill-column-indicator.el setting
;; hot key: C-x m      unset C-u C-x m
;; --------------------------------------------------------------------
(require 'column-marker)
(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))    
(global-set-key [?\C-x ?m] 'column-marker-3)
(require 'fill-column-indicator)  
(setq fci-rule-width 2)  
(setq fci-rule-color "yellow")  
(setq fci-rule-column 80)  
(define-globalized-minor-mode   
  global-fci-mode fci-mode (lambda () (fci-mode 1)))  
(global-fci-mode 1)  

;;------------------------------------------------------------------------------
;; add ace-jump mode for quick jump http://www.emacswiki.org/emacs/AceJump
;; download from 
;;     https://github.com/winterTTr/ace-jump-mode/blob/master/ace-jump-mode.el
;;------------------------------------------------------------------------------
(require 'ace-jump-mode)
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-x SPC") 'ace-jump-mode)
(global-set-key (kbd "M-z") 'ace-jump-mode)
(define-key global-map (kbd "C-x n") 'ace-jump-line-mode)
;; If you also use viper mode:
;; (define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)

;;------------------------------------------------------------------------------
;; add quick-jump mode 
;; download from http://www.emacswiki.org/emacs/quick-jump.el
;;------------------------------------------------------------------------------
(require 'quick-jump)
;; (quick-jump-default-keybinding)
(global-set-key (kbd "C-<") 'quick-jump-go-back)
(global-set-key (kbd "C->") 'quick-jump-go-forward)
(global-set-key (kbd "C-x C-x") 'quick-jump-push-marker)
(global-set-key (kbd "C-c C-c") 'quick-jump-clear-all-marker)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emace auto-complete version 1.3.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/ac-dict")
(setq ac-comphist-file (expand-file-name
                        "~/.emacs.d/ac-comphist.dat"))
(ac-config-default)

;;------------------------------------------------------------------------------
;; emacs-eclim setting
;;------------------------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/emacs-eclim"))
(require 'eclim)
(setq eclim-auto-save t)
(global-eclim-mode)
;; If you want to control eclimd from emacs, also add:
(require 'eclimd)
;; boot the eclimd server by hand run as
;; ~/software/eclipse/eclimd
;; or M-x start-eclim/stop-eclim

(custom-set-variables
  '(eclim-eclipse-dirs '("~/software/eclipse"))    
  '(eclim-executable "~/software/eclipse/eclim"))

;; Displaying compilation error messages in the echo area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; If you wish to use auto-complete-mode with emacs-eclim, 
;;    add the following to your .emacs:
;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

;; Configuring company-mode
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)
(require 's)
(add-hook 'after-init-hook 'global-company-mode)
(load-file "/home/aborn/.emacs.d/modules/tkj-java.el")
