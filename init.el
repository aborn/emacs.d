;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs initial config for version 23 and later version
;; put this file (init.el) in ~/.emacs.d/
;; You are advised to use emacs 24.5+
;; some softwares are recommanded to install(sw.md).
;; emacs的配置，建议使用最新版本的emacs (version 24.5)
;; 为了更好的使用，需要安装一些软件, 见sw.md
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; --------------------------------------------------------------------
;; benchmark-init, 测试加载速度
;; https://github.com/dholm/benchmark-init-el
;; --------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/benchmark-init")
(require 'benchmark-init-loaddefs)
(benchmark-init/activate)

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
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-async")
(add-to-list 'load-path "~/.emacs.d/parts/")

;; --------------------------------------------------------------------
;; setting exec-path, which like terminal's PATH variable
;; emacs的可执行文件路径，相当于PATH
;; 我发现 setenv "PATH" 和 exec-path并不相等，
;;    如果没有做setenv操作，会产生
;;    node: No such file or directory 这样的错误
;;    同时在执行 helm-do-grep 时产生
;;     zsh: command not found: ack
;; 详情请看: http://ergoemacs.org/emacs/emacs_env_var_paths.html
;;    见package-part.el里的  exec-path-from-shell
;; --------------------------------------------------------------------
;; (add-to-list 'exec-path "/usr/local/racket/bin")
;; (add-to-list 'exec-path "/usr/local/bin")
;; (add-to-list 'exec-path "/usr/local/Cellar/grep/2.22/bin")
;; (add-to-list 'exec-path "/usr/local/Cellar/ack/2.14/bin")
;; (setenv "PATH" (concat "/usr/local/bin:/usr/local/Cellar/ack/2.14/bin:" (getenv "PATH")))

;; --------------------------------------------------------------------
;; add require features defined by myself
;; 自己写的一些modue或config
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
(require 'basic-key-binding)           ;; 基本的快捷键设置
(require 'os-utils)
(require 'extend-selection)
(require 'multi-term-config)
(require 'csv-mode)
(require 'rich-minority)

;; --------------------------------------------------------------------
;; emacs package manager
;; Emacs is not a package manager, and here we load its package manager!
;; 设置包管理源
;; --------------------------------------------------------------------
(require 'package)
;;(add-to-list 'package-archives
;;'("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives
;;'("melpa" . "https://melpa.org/packages/")
;;t)
(add-to-list 'package-archives
             '("popkit" . "http://elpa.popkit.org/packages/"))
(package-initialize)
(require 'init-helm-aborn)

;; --------------------------------------------------------------------

;; set code indent
;; 设置代码格式化
;; --------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
;; (setq default-tab-width 4)   ;; 这个变量已经被废弃了!
(setq tab-width 4)
;;(setq max-lisp-eval-depth 3000)      ;; default 500
;;(setq max-specpdl-size 3000)         ;; default 1000

;; --------------------------------------------------------------------
;; add follwing code to keep *shell* in middle using
;;    C-l C-l  使得*shell* buffer处于中间
;; --------------------------------------------------------------------
(remove-hook 'comint-output-filter-functions 
			 'comint-postoutput-scroll-to-bottom)

;; --------------------------------------------------------------------
;; basic setting for emacs and mode turn on or off when boot up
;; emacs的一些最基本的设置
;; --------------------------------------------------------------------
(setq inhibit-startup-message t)    ; 打下*Message* buffer
(require 'hl-line)                  ; highlight current line
(global-hl-line-mode t)             ; setting as global hl
(setq x-select-enable-clipboard t)  ; copy and paste with other program
(show-paren-mode t)                 ; paren match show
(column-number-mode t)              ; show column number
(global-auto-revert-mode t)         ; 恢复与还原
(global-linum-mode t)               ; show line number
(setq linum-format "%4d \u2502")    ; for GUI and command line emacs 24
(setq frame-title-format '("%b (%f) &aborn love cld&  [%s] emacs" emacs-version))   
(require 'uniquify)                 ; 文件名相同时buffer采用路径逆序
(setq uniquify-buffer-name-style 'reverse)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)       ; 用y/n代替yes/no
(rich-minority-mode 1)
(tool-bar-mode -1)                  ; 关闭toobar
(electric-pair-mode 1)              ; 自动插入右括号{}()[]等
(setq gc-cons-threshold 100000000)  ; 100MB,否则会偶尔crash
(delete-selection-mode 1)           ; yank into selected region
(winner-mode 1)                     ; winner-undo and winner-redo

;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (flyspell-prog-mode)                ; flyspell mode for comments & strings only

;; (kill-buffer "*scratch*")
(find-file "~/.emacs.d/init.el")    ; initial open init.el file 
;;(unless (get-buffer "*shell*")
;;  (shell))                          ; open shell when boot up

;; coffee-mode for coffeescript programming
;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;; This gives you a tab of 2 spaces
(custom-set-variables '(coffee-tab-width 2))

;; --------------------------------------------------------------------
;;  mode line setting
;; --------------------------------------------------------------------
(display-time)
(setq display-time-24hr-format t)
(setq display-time-use-mail-icon t)
(setq display-time-day-and-date t)

;; --------------------------------------------------------------------
;; from http://nongnu.askapache.com//color-theme/color-theme-6.6.0.zip
;; then unzip this file into ~/.emacs.d/site-lisp/
;; 设置颜色模式 modules/dream-theme.el
;; 这里使用dream-theme颜色 https://github.com/djcb/dream-theme
;; --------------------------------------------------------------------
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)			

(if (file-exists-p "~/.emacs.d/local/local-setting.el")
	(message "use local-setting.el configure")       ;; using the local setting
  (color-theme-robin-hood))
(color-theme-tty-dark)
(require 'dream-theme)
;; (setq highlight-tail-colors '(("black" . 0)
;;							  ("#bc2525" . 25)
;;							  ("black" . 66)))
;;(color-theme-dark-green)          ;; other options
;;(color-theme-billw)               ;; other options
;;(Color-theme-subtle-hacker)       ;; this for GUI, or color-theme-select
;;(color-theme-tty-dark)            ;; this for command line mode


;; --------------------------------------------------------------------
;; 下面这些pkg是通过melpa的包管理进行安装
;; --------------------------------------------------------------------
(require 'expand-region)   ;; 跟 extend-selection 类似
(global-set-key (kbd "C-l") 'er/expand-region)
;;(require 'yasnippet)
;;(yas-reload-all)
;;(yas-global-mode 1)      ;; 不要在所有mode里打开

;; ********************************************
;; install smart-mode-line  使得mode-line更好看
;; https://github.com/Malabarba/smart-mode-line
;; install smart-mode-line-powerline-theme
;; https://github.com/milkypostman/powerline
;; ********************************************
(setq sml/no-confirm-load-theme t)
(sml/setup)
(require 'powerline)
(powerline-default-theme)

(add-hook 'after-init-hook 'global-company-mode)

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
;; 列标记模式
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emace auto-complete version 1.5
;; 自动补全,最新版本下载
;; 见: https://github.com/auto-complete/auto-complete/releases
;; now use company-mode as default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/ac-dict")
;; ;;(setq ac-comphist-file (expand-file-name
;; ;;                        "~/.emacs.d/ac-comphist.dat"))
;; (ac-config-default)

;; ;; 采用helm的框架进行补全操作
;; (require 'ac-helm)  ;; Not necessary if using ELPA package
;; (global-set-key (kbd "C-\"") 'ac-complete-with-helm)
;; ;;(global-set-key (kbd "TAB") 'ac-complete-with-helm)
;; (define-key ac-complete-mode-map (kbd "C-\"") 'ac-complete-with-helm)
;; ;;(define-key ac-complete-mode-map (kbd "TAB") 'ac-complete-with-helm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set markdown-mode download from 
;;                    http://jblevins.org/projects/markdown-mode/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/modules/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; define markdown-mode-map
(define-key markdown-mode-map (kbd "\C-c\C-k") 'start-kbd-macro)
(define-key markdown-mode-map (kbd "\C-x SPC") 'ace-jump-mode)
(define-key markdown-mode-map (kbd "<M-return>") 'ab/quick-file-jump)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install cedet and add speedbar download from 
;;     http://www.emacswiki.org/emacs/sr-speedbar.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-ede-mode 1)
;;(require 'semantic/analyze)
;;(require 'semantic/sb)
;; (semantic-mode 1)
;; (provide 'semantic-analyze)
;; (provide 'semantic-ctxt)
;; (provide 'semanticdb)
;; (provide 'semanticdb-find)
;; (provide 'semanticdb-mode)
;; (provide 'semantic-load)

;; Semantic
;; (global-semantic-idle-completions-mode -1)
;; (global-semantic-show-unmatched-syntax-mode nil)
;; (global-semantic-idle-completions-mode t)
;; (global-semantic-decoration-mode t)
;; (global-semantic-highlight-func-mode t)
;; (global-semantic-show-unmatched-syntax-mode t)

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
;;(setq sr-speedbar-width-x 20)

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
(desktop-save-mode 0)     ;; 暂时关闭自动保存功能，太消耗启动时间 1 为打开
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
;; 感觉avy.el要比ace更新  ace-jump-helm-line 需要avy mode
;;     https://github.com/abo-abo/avy
;;------------------------------------------------------------------------------
(require 'ace-jump-mode)
;;(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
;;(global-set-key (kbd "C-x SPC") 'ace-jump-mode)
(global-set-key (kbd "M-z") 'ace-jump-mode)
(global-set-key (kbd "M-n") 'ace-jump-mode)
(define-key global-map (kbd "C-x n") 'ace-jump-line-mode)

(require 'ace-jump-helm-line)
(eval-after-load "helm"
  '(define-key helm-map (kbd "M-n") 'ace-jump-helm-line))
(setq ace-jump-helm-line-use-avy-style nil)
;; If you also use viper mode: (vim的一个模式)
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
;; highlight-tail, which is download from 
;;     http://blog.arithm.com/2008/04/12/highlight-tail-for-emacs/
;; and the chinese reference is
;;     http://emacser.com/highlight-tail.htm
;; the file is highlight-tail.el
;; donot use highlight-tail in mac system
;;------------------------------------------------------------------------------
;; (require 'highlight-tail)
;; (message "Highlight-tail loaded - now your Emacs will be even more sexy!")
;;  here some setq of variables - see CONFIGURATION section below 
;; (setq highlight-tail-colors '(("black" . 0)
;;							  ("#bc2525" . 25)
;;							  ("black" . 66)))
;; (setq highlight-tail-steps 14
;;	  highlight-tail-timer 1)
;; (setq highlight-tail-posterior-type 'const)

;; (if (not highlight-tail-mode) 
;;	(highlight-tail-mode 1)   ;; open tail mode if it does not open
;;  (message "highlight-mode-mode already opened."))             

;;------------------------------------------------------------------------------
;; add maxframe package.
;; https://github.com/rmm5t/maxframe.el
;;   in mac system, do not use to max the current frame
;;------------------------------------------------------------------------------
(require 'maxframe)
;; mac系统下,最大化时留出左边50px显示panel
(when (string= system-type "darwin")
  (if (equal (display-pixel-width) 1920)
      (setq mf-offset-x 65)
    (setq mf-offset-x 50))
  (setq mf-max-width (- (display-pixel-width) mf-offset-x)))
(add-hook 'window-setup-hook 'maximize-frame t)

;;------------------------------------------------------------------------------
;; personal information these variables may be used in 
;; ~/.emacs.d/utils/insert-string.el
;;------------------------------------------------------------------------------
(setq user-full-name "Aborn Jiang"
      user-mail-address "aborn.jiang@foxmail.com")
(setq chinese-name "Guobao Jiang")             ;
(setq shell-name "eshell")        ;; default for shell
(defconst ab-message-buffer-name "*Aborn Info Buffer*")
;;(setq shell-name "shell")      ;; default value

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
;; add quack for racket-lang, which download from 
;;   http://www.neilvandyke.org/quack/
;; add geiser , download from 
;;      http://www.nongnu.org/geiser/ using git clone
;;      git clone http://git.sv.gnu.org/r/geiser.git
;; now use racket-mode as default
;;    https://github.com/greghendershott/racket-mode
;; -----------------------------------------------------------------------------
(require 'racket-mode)
(require 'racket-complete)
(setq tab-always-indent 'complete)

;; (load "~/.emacs.d/site-lisp/geiser/elisp/geiser-load")
;; (require 'geiser-load)
;; (require 'quack)
;; (add-hook 'geiser-repl-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-j") 'switch-to-buffer) 
;;             ))
;; (setq racket-racket-program "/usr/local/bin/racket")
;; (setq racket-raco-program "/usr/local/bin/raco")
;; (setq geiser-scheme-dir "~/.emacs.d/code")
;; (setq scheme-program-name "racket")

(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "C-x C-j") 'racket-run)))

;; -----------------------------------------------------------------------------
;; shell completion mode, which download
;; http://www.emacswiki.org/emacs/download/shell-completion.el
;; and http://www.namazu.org/~tsuchiya/elisp/shell-command.el
;; and https://github.com/szermatt/emacs-bash-completion
;; and https://github.com/mooz/emacs-zlc/     (for zsh)
;; -----------------------------------------------------------------------------
;; (require 'shell-completion)
;; (require 'shell-command)
;; (shell-command-completion-mode)
;; (require 'bash-completion)
;; (bash-completion-setup)
;; (require 'zlc)
;; (zlc-mode t)

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
;; 默认启动ido模式，它用于快速切换buffer，这个被helm替换，helm更好
;; -----------------------------------------------------------------------------
(require 'ido)
(ido-mode t)

;; -----------------------------------------------------------------------------
;; eshell settings
;; this setting must be put before eshell startup
;; -----------------------------------------------------------------------------
(setq eshell-save-history-on-exit t)
(load-file "~/.emacs.d/utils/eshell-utils.el")
(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'switch-to-buffer)
            (local-set-key (kbd "C-a") 'eshell-bol)
            (local-set-key (kbd "C-c SPC") 'ace-jump-mode)
            (local-set-key (kbd "M-p") 'eshell-previous-matching-input-from-input)
            (local-set-key (kbd "M-n") 'eshell-next-matching-input-from-input)
            (local-set-key (kbd "C-M-n") 'set-mark-command)
            (local-set-key (kbd "<up>") 'eshell-previous-matching-input-from-input)
            (local-set-key (kbd "C-x C-j") 'eshell/clear)
            (local-set-key (kbd "M-r") 'eshell-isearch-backward)
            (local-set-key (kbd "<down>") 'eshell-next-matching-input-from-input)))

;; -----------------------------------------------------------------------------
;; edit-server.el  for chrome edit with emacs, this 
;; is a chrome extension 
;; -----------------------------------------------------------------------------
(when (locate-library "edit-server")
  (require 'edit-server)
  (setq edit-server-new-frame nil)
  (edit-server-start))

;; -----------------------------------------------------------------------------
;; cursor change automatically based the file mode
;; http://www.emacswiki.org/emacs-en/ChangingCursorDynamically
;; only can be used when you are not use OneOneOneEmacs
;; -----------------------------------------------------------------------------
(require 'cursor-chg)            ; Load the library
(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
(change-cursor-mode 1)           ; Turn on change for overwrite, read-only, and input mode

;; -----------------------------------------------------------------------------
;; some configure from Sacha Chua
;; http://pages.sachachua.com/.emacs.d/Sacha.html
;; -----------------------------------------------------------------------------
;; for backups files 
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list" t)))

;; Smartscan
(require 'smartscan)
(global-smartscan-mode t)
(define-key smartscan-map (kbd "M-o") 'smartscan-symbol-go-forward)
(define-key smartscan-map (kbd "M-l") 'smartscan-symbol-go-backward)

;; Searching based on the current word
(load-file "~/.emacs.d/utils/sacha-search.el")
(global-set-key '[C-up] 'sacha/search-word-backward)
(global-set-key '[C-down] 'sacha/search-word-forward)
;; !!NOTE: smartscan and sacha/search take similar actions.

;; -----------------------------------------------------------------------------
;; automatic and manual symbol highlighting for Emacs
;; link: https://github.com/nschum/highlight-symbol.el
;; -----------------------------------------------------------------------------
(require 'highlight-symbol)
(global-set-key (kbd "<C-return>") 'highlight-symbol-at-point)
(global-set-key (kbd "C-x C-SPC") 'highlight-symbol-mode)
;; (global-set-key (kbd "C-x RET") 'highlight-symbol-at-point)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font 
(set-face-attribute
 'default nil :font "Fira Code 15")  ;;previous "Monaco 14"
(when (window-system)
  (set-frame-font "Fira Code 15")
  (message "Fira Code turn on!"))

;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Kaiti SC" :size 15)))
;; Note: you can chang "Kaiti SC" to "Microsoft YaHei" or other fonts

;; -----------------------------------------------------------------------------
;; start some modules when bootup.
;; -----------------------------------------------------------------------------
;; (eshell)                         ;; open eshell at boot
;;(ielm)
;; (ab/shell "2shell")              ;; open another shell

;; -----------------------------------------------------------------------------
;; js2-mode for javascript
;; -----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/js2-mode")
;;(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)

;; -----------------------------------------------------------------------------
;; 用emacs远程打开文件
;; https://andy.wordpress.com/2013/01/03/automatic-emacsclient/
;; setting emacsclient remote open file
;; -----------------------------------------------------------------------------
;;(defun server-start-and-copy ()
;;  "start server and copy auth files"
;;  (when (and (fboundp 'server-running-p)   ; function exists.
;;             (not (server-running-p)))
;;    (server-start)                       ; emacs as server mode
;;    (when (file-exists-p "/lisp@yoks:~/.emacs.d/server/server")
;;      (delete-file "/lisp@yoks:~/.emacs.d/server/server"))
;;    (copy-file "~/.emacs.d/server/server" "/lisp@yoks:~/.emacs.d/server/server")
;;    ))
;;(add-hook 'emacs-startup-hook 'server-start-and-copy)
;;(server-start-and-copy)

(require 'server)
(setq server-use-tcp t
      server-socket-dir "~/.emacs.d/server")
(unless (server-running-p)
  (server-start))

;; -----------------------------------------------------------------------------
;; setting golden-ratio.el (in ~/.emacs.d/modules/)
;; see more detail https://github.com/roman/golden-ratio.el
;; roman 写的这个golden-ration会引起crash
;; 使用thierryvolpiatto写的这个golden
;; https://github.com/thierryvolpiatto/golden-ratio.el
;; 无论怎样都有bug,还是暂时关了吧
;; -----------------------------------------------------------------------------
;; (require 'golden-ratio)
;; (golden-ratio-mode 1)

;; -----------------------------------------------------------------------------
;; request.el http request模式
;; get http://appkit.popkit.org/demo/getJSON.html for example!
;; -----------------------------------------------------------------------------
(require 'request)

;; 下面是一个简单的例子
;; (request
;;  "http://httpbin.org/get"
;;  :params '(("key" . "value") ("key2" . "value2"))
;;  :parser 'json-read
;;  :success (function*
;;            (lambda (&key data &allow-other-keys)
;;              (message "I sent: %S" (assoc-default 'args data)))))

;; -----------------------------------------------------------------------------
;; key binding, all files are in ~/.emacs.d/keys-setting
;; 全局的key-setting，这个配置放在最后
;; global-key-binding是全局的按键绑定
;; major-mode-binding是加一些hook修改一些主mode的快捷键
;; -----------------------------------------------------------------------------
(require 'global-key-binding)            ; global key binding
(require 'major-mode-binding)            ; local major mode key binding

(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

;; -----------------------------------------------------------------------------
;; recent files
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; -----------------------------------------------------------------------------
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 25)
(recentf-mode 1)

;; -----------------------------------------------------------------------------
;; 自动编译 auto-compile  依赖 packed.el 和 dash.el
;; https://github.com/tarsius/auto-compile
;;  deps:
;;    https://github.com/tarsius/packed
;;    https://github.com/magnars/dash.el
;; -----------------------------------------------------------------------------
;;; init.el --- user init file      -*- no-byte-compile: t -*-
(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

;; 初始化编译 init.el
;; (defconst dot-emacs (concat (getenv "HOME") "/.emacs.d/" "init.el")
;;     "My dot emacs file")
;; (require 'bytecomp)
;; (setq compiled-dot-emacs (byte-compile-dest-file dot-emacs))
;; (if (or (not (file-exists-p compiled-dot-emacs))
;; 	(file-newer-than-file-p dot-emacs compiled-dot-emacs)
;;         (equal (nth 4 (file-attributes dot-emacs)) (list 0 0)))
;;     (load dot-emacs)
;;   (load compiled-dot-emacs))

;; (add-hook 'kill-emacs-hook
;;           '(lambda () (and (file-newer-than-file-p dot-emacs compiled-dot-emacs)
;;                            (byte-compile-file dot-emacs))))


;; -----------------------------------------------------------------------------
;; web-beautify
;; install npm -g install js-beautify
;; https://github.com/yasuyk/web-beautify
;; -----------------------------------------------------------------------------
(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;; (eval-after-load 'js
;;   '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))
;; (eval-after-load 'json-mode
;;   '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
;; (eval-after-load 'sgml-mode
;;   '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
;; (eval-after-load 'css-mode
;;   '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; -----------------------------------------------------------------------------
;; https://github.com/antonj/Highlight-Indentation-for-Emacs
;; -----------------------------------------------------------------------------
(require 'highlight-indentation)
;; (highlight-indentation-mode)
;; (highlight-indentation-current-column-mode)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
(global-set-key (kbd "C-c a") 'aj-toggle-fold)

;; -----------------------------------------------------------------------------
;; some config-part
;; elixir语言mode
;; 需要通过elpa安装alchemist和alchemist
;; -----------------------------------------------------------------------------
(require 'elixir-part)
(require 'package-part)
(require 'c-lang-part)
(require 'pkg-server)
(require 'web-part)
(require 'ace-jump-helm-line)
(require 'ivy-parts)
;; (ab/list-packages)             ;; 异步打开下软件源
(add-hook 'after-init-hook
		  (lambda ()
			(load-file helm-adaptive-history-file)))

(setq debug-function-file "~/.emacs.d/debug-function.el")
(when (file-readable-p debug-function-file)
  (load-file debug-function-file))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; last modified by Aborn Jiang (aborn.jiang@foxmail.com) at 2015-12-20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(popup-face ((t (:background "gray94" :foreground "dark cyan"))))
 '(popup-tip-face ((t (:background "dark red" :foreground "light green")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(session-use-package t nil (session)))
