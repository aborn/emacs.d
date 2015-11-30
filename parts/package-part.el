;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 这里放的是从 Marmalade and MELPA 安装的包
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'use-package)
(setq use-package-verbose t)

;; --------------------------------------------------------------------
;; exec-path-from-shell
;; https://github.com/purcell/exec-path-from-shell
;; --------------------------------------------------------------------
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 下面是自己写的函数，主要是多电脑时，把安装的packages保存到一个文件里去
(setq ab/save-package-activated-list-file "~/.emacs.d/ab-installed-packages")
(defvar ab-installed-packages nil)

(defun ab/save-package-activated-list (&optional arg)
  "Save history information to file given by `helm-adaptive-history-file'."
  (interactive "p")
  (with-temp-buffer
    (insert
     ";; -*- mode: emacs-lisp -*-\n"
     ";; Installed packages list used for multi computer env.\n")
    (prin1 `(setq ab-installed-packages ',package-activated-list)
           (current-buffer))
    (insert ?\n)
    (write-region (point-min) (point-max) ab/save-package-activated-list-file nil
                  (unless arg 'quiet))))

;; 关闭emacs的时候，保存下当前已经安装的packages
(add-hook 'kill-emacs-hook 'ab/save-package-activated-list)
(add-hook 'after-init-hook
          (lambda ()
            (when (file-readable-p ab/save-package-activated-list-file)
              (load-file ab/save-package-activated-list-file))))

(provide 'package-part)
