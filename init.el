;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs basic setting only for version 23 and later version
;; put this file (init.el) in ~/.emacs.d/
;; NOTE: ~/.emacs.d/init.el equals to ~/.emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/site-lisp/wubi")
(add-to-list 'load-path "~/.emacs.d/keys-setting/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/old-emacs-package/")
(add-to-list 'load-path "~/.emacs.d/local/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/custom/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/iemacsfun/")

;; (require 'load-directory)
;; (load-directory "~/.emacs.d/site-lisp/iemacsfun/")

;; --------------------------------------------------------------------
;; setting exec-path, which like terminal's PATH variable
;; --------------------------------------------------------------------
(add-to-list 'exec-path "/usr/local/racket/bin")

;; --------------------------------------------------------------------
;; add require features defined by myself
;; --------------------------------------------------------------------
(require 'copy-line)
(require 'move-swift)
(require 'switch-swift)
(require 'emacs-nifty-tricks)
(require 'insert-string)
(require 'buffer-dealing)

;; --------------------------------------------------------------------
;; set indent
;; --------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
;;(setq max-lisp-eval-depth 3000)      ;; default 500
;;(setq max-specpdl-size 3000)         ;; default 1000

;; (customize-variable (quote tab-stop-list))

;; --------------------------------------------------------------------;
;; add follwing code to keep *shell* in middle using
;;    C-l C-l
;; --------------------------------------------------------------------;
(remove-hook 'comint-output-filter-functions 
			 'comint-postoutput-scroll-to-bottom)

;; --------------------------------------------------------------------
;; basic setting for emacs and mode turn on or off when boot up
;; --------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("*shell*") ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*" . t) ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*"))))
 '(ecb-layout-name "left8")
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-prescan-directories-for-emptyness t)
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-sources-menu-user-extension-function (quote ignore))
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-width 0.16)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(session-use-package t nil (session))
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64))))

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
(if (get-buffer "*shell*")
	()                              ; if *shell* buffer exists, do nothing
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

(if (file-exists-p "~/.emacs.d/local/local-setting.el")
	(message "use local-setting.el configure")            ;; using the local setting
  (color-theme-robin-hood)
  (eval-after-load "color-theme" 
	(if window-system  
		'(color-theme-subtle-hacker)  ;; GUI mode
	  '(color-theme-tty-dark)))       ;; Command line mode
  )

;;(color-theme-dark-green)          ;; other options
;;(color-theme-billw)               ;; other options
;;(Color-theme-subtle-hacker)       ;; this for GUI, or color-theme-select
;;(color-theme-tty-dark)            ;; this for command line mode

;; --------------------------------------------------------------------
;; column-marker.el and fill-column-indicator.el setting
;; --------------------------------------------------------------------
(require 'column-marker)
(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))    
(global-set-key [?\C-x ?m] 'column-marker-3)
;; un-marker  C-uu column-marker-3
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
(setq ac-comphist-file (expand-file-name
             "~/.emacs.d/ac-comphist.dat"))
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
(global-ede-mode 1)
(require 'semantic/analyze)
(require 'semantic/sb)
(semantic-mode 1)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)

;; Semantic
(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)

;; CC-mode
(add-hook 'c-mode-hook '(lambda ()
        (setq ac-sources (append '(ac-source-semantic) ac-sources))
        (local-set-key (kbd "RET") 'newline-and-indent)
        (linum-mode t)
        (semantic-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting speedbar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'sr-speedbar)
(global-set-key (kbd "C-x C-y") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)  ;; nil means speedbar appears on left
(setq sr-speedbar-skip-other-window-p t)
(setq speedbar-show-unknown-files t)
;;(setq sr-speedbar-max-width 10)
;;(setq sr-speedbar-width-x 10)

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
(require 'matlab)
(require 'cedet-matlab)

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
;; (global-set-key "\C-c\C-j" 'toggle-input-method)  ;; other except .md
;; (global-set-key "\C-cj" 'toggle-input-method)     ;; .md
(global-set-key [?\S- ] 'toggle-input-method)     ;; .md and other

;;------------------------------------------------------------------------------
;; add sql-indent mode
;; wget http://www.emacswiki.org/emacs/sql-indent.el
;;------------------------------------------------------------------------------
(eval-after-load "sql"
  (load-library "sql-indent"))

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

;;------------------------------------------------------------------------------
;; add vim mode
;;  download from git clone git://gitorious.org/evil/evil.git
;;------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(require 'evil)
(global-set-key (kbd "C-x C-SPC") 'evil-mode)

;;------------------------------------------------------------------------------
;; highlight-tail, which is download from 
;;     http://blog.arithm.com/2008/04/12/highlight-tail-for-emacs/
;; and the chinese reference is
;;     http://emacser.com/highlight-tail.htm
;; the file is highlight-tail.el
;;------------------------------------------------------------------------------
(require 'highlight-tail)
(message "Highlight-tail loaded - now your Emacs will be even more sexy!")
;;  here some setq of variables - see CONFIGURATION section below 
;; (setq highlight-tail-colors '(("black" . 0)
;;							  ("#bc2525" . 25)
;;							  ("black" . 66)))
(setq highlight-tail-steps 14
	  highlight-tail-timer 1)
(setq highlight-tail-posterior-type 'const)

(if (not highlight-tail-mode) 
	(highlight-tail-mode 1)   ;; open tail mode if it does not open
  (message "highlight-mode-mode already opened."))             

;;------------------------------------------------------------------------------
;; change to dream-theme, this theme file in site-lisp/custom/dream-theme.el
;; download from https://github.com/djcb/dream-theme
;;------------------------------------------------------------------------------
;; (require 'dream-theme)

;;------------------------------------------------------------------------------
;; add maxframe package.
;; https://github.com/rmm5t/maxframe.el
;;------------------------------------------------------------------------------
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;;------------------------------------------------------------------------------
;; personal information these variables may be used in 
;; ~/.emacs.d/site-lisp/iemacsfun/insert-string.el
;;------------------------------------------------------------------------------
(setq email-address "aborn.jiang@foxmail.com");
(setq english-name "Aborn Jiang");
(setq chinese-name "蒋国宝");

;;------------------------------------------------------------------------------
;; Add MIT/GNU scheme xscheme.el, which download from
;; http://ftp.gnu.org/gnu/mit-scheme/utilities.pkg/xscheme.el
;;------------------------------------------------------------------------------
(require 'xscheme)

;;------------------------------------------------------------------------------
;; Add buffer-move.el download from
;; http://www.emacswiki.org/cgi-bin/wiki/buffer-move.el
;;------------------------------------------------------------------------------
(require 'buffer-move)

;;------------------------------------------------------------------------------
;; add gnus, download using following command.
;; supported on begin emacs 24.4
;;      git clone http://git.gnus.org/gnus.git
;; in ~/.emacs.d/gnus
;; add eww Emacs Web Wowser, download from 
;; http://bzr.savannah.gnu.org/lh/emacs/trunk/annotate/head:/lisp/net/eww.el
;;------------------------------------------------------------------------------

;; (setq load-path (cons (expand-file-name "~/.emacs.d/gnus/lisp/") load-path))
;; (when (file-directory-p "~/.emacs.d/gnus")
;;   (require 'gnus-load)
;;   (require 'info)
;;   (if (featurep 'xemacs)
;; 	  (add-to-list 'Info-directory-list "~/.emacs.d/gnus/texi/")
;; 	(add-to-list 'Info-default-directory-list "~/.emacs.d/gnus/texi/"))
;;   )

;; -----------------------------------------------------------------------------
;; add eww for emacs 24.4
;; note : eww only supported by emacs 24.4+
;; download the newest emacs 24.4.50.1
;;   git clone http://repo.or.cz/r/emacs.git
;; install http://ergoemacs.org/emacs/building_emacs_from_git_repository.html
;;   ./autogen.sh
;;   ./configure
;;   make bootstrap     # optimal
;;   make
;; -----------------------------------------------------------------------------
(when (string= 
	   (format "%d.%d" emacs-major-version emacs-minor-version) "24.4")
  (require 'advice)
  (require 'eww)
  (message "emacs version 24.4")
  )

;; -----------------------------------------------------------------------------
;; add quack for racket-lang, which download from 
;;   http://www.neilvandyke.org/quack/
;; add geiser , download from 
;;      http://www.nongnu.org/geiser/ using git clone
;;      git clone http://git.sv.gnu.org/r/geiser.git
;; -----------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(load "~/.emacs.d/site-lisp/geiser/elisp/geiser-load")
;;(require 'geiser-load)
(require 'quack)

;; -----------------------------------------------------------------------------
;; shell completion mode, which download
;; http://www.emacswiki.org/emacs/download/shell-completion.el
;; and http://www.namazu.org/~tsuchiya/elisp/shell-command.el
;; and https://github.com/szermatt/emacs-bash-completion
;; and https://github.com/mooz/emacs-zlc/     (for zsh)
;; -----------------------------------------------------------------------------
(require 'shell-completion)
(require 'shell-command)
(shell-command-completion-mode)
(require 'bash-completion)
(bash-completion-setup)
(require 'zlc)
(zlc-mode t)

;; -----------------------------------------------------------------------------
;; add ecb, ecb homepage: ecb.sourceforge.net
;; ecb byte-compile using M-x ecb-byte-complie
;; -----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40/")
(require 'ecb)
;; (require 'ecb-autoloads)
(setq stack-trace-on-error t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ---- this has added in local-setting.el 
;; (setq ecb-auto-activate t
;;       ecb-tip-of-the-day nil)
;; -----------------------------------------

;; switch window between ecb all windows
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
 
;; hide or show ecb window
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
 
;; maximize specific window
(define-key global-map "\C-c1" 'ecb-maximize-window-directories)
(define-key global-map "\C-c2" 'ecb-maximize-window-sources)
(define-key global-map "\C-c3" 'ecb-maximize-window-methods)
(define-key global-map "\C-c4" 'ecb-maximize-window-history)

;; restore-default
(define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)

;; -----------------------------------------------------------------------------
;; add jdee for jave development
;; -----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/site-lisp/jdee-2.4.1/lisp/")
(load "jde")

;; -----------------------------------------------------------------------------
;; key binding, all files are in ~/.emacs.d/keys-setting
;; -----------------------------------------------------------------------------
(require 'global-key-binding)            ; global key binding
(require 'major-mode-binding)            ; local major mode key binding

;; -----------------------------------------------------------------------------
;; icomplete+.el   http://www.emacswiki.org/emacs/icomplete+.el
;; mcomplete.el
;; http://homepage1.nifty.com/bmonkey/emacs/elisp/mcomplete.el
;; -----------------------------------------------------------------------------
(require 'icomplete+)
(require 'mcomplete)
(autoload 'mcomplete-mode "mcomplete"
  "Toggle minibuffer completion with prefix and substring matching."
  t nil)
(autoload 'turn-on-mcomplete-mode "mcomplete"
  "Turn on minibuffer completion with prefix and substring matching."
  t nil)
(autoload 'turn-off-mcomplete-mode "mcomplete"
  "Turn off minibuffer completion with prefix and substring matching."
  t nil)

;; *****************************************************************************
;; !! NOTE: local machine file setting.
;; this machine's local setting in
;;  ~/.emacs.d/local/local-setting.el
;; *****************************************************************************
(if (file-exists-p "~/.emacs.d/local/local-setting.el")
	(require 'local-setting))
(server-start)                    ; emacs as server mode

;; -----------------------------------------------------------------------------
;;Remove/kill completion buffer when done-----
;;could use ido-find-file instead, since it never uses *Completions*
;;Note that ido-mode affects both buffer switch, &  find file.
;; -----------------------------------------------------------------------------
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))
             ))

;; -----------------------------------------------------------------------------
;;only show auto-completions buffer on second Tab-press
;;if no match is found
;; -----------------------------------------------------------------------------
(setq completion-auto-help 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; last modified by Aborn Jiang (aborn.jiang@gmail.com) at 2014-05-04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
