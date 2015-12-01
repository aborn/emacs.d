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
;; 打开emacs的时候，load安装的packages
(add-hook 'after-init-hook
          (lambda ()
            (when (file-readable-p ab/save-package-activated-list-file)
              (load-file ab/save-package-activated-list-file))))

;;http://ergoemacs.org/emacs/elisp_printing.html
(defun ab/print-installed-packages (&optional arg)
  "print info installed packages"
  (interactive "p")
  (with-current-buffer (get-buffer-create ab-message-buffer-name)
    (dolist (pkg ab-installed-packages)
      (insert "\n")
      (princ pkg (current-buffer)))))

(defun ab/log (msg)
  (with-current-buffer (get-buffer-create ab-message-buffer-name)
    (princ msg (current-buffer))))

(defun ab/install-missed-package (&optional arg)
  "install missed package"
  (interactive "p")
  (async-start
   '(lambda ()
      ;; install the missing packages
      (dolist (package ab-installed-packages)
        (message "package %s" package)
        (unless (package-installed-p package)
          (package-install package))))))


;; 异步的列出packages
(defun ab/list-packages ()
  "package-install async"
  (interactive)
  (async-start
   `(lambda ()
      (setq package-archives
            '(("melpa"         . "http://melpa.org/packages/"); 
              ("org"         . "http://orgmode.org/elpa/")
              ("marmalade"   . "http://marmalade-repo.org/packages/")));
      (require 'finder-inf nil t)
      ;; Initialize the package system if necessary.
      (package-initialize t)
      (setq coding-system-for-write 'utf-8-unix)
      (let (old-archives new-packages)
        ;; Read the locally-cached archive-contents.
        (package-read-all-archive-contents)
        (setq old-archives package-archive-contents)
        ;; Fetch the remote list of packages.
        (package-refresh-contents)
        ;; Find which packages are new.
        (dolist (elt package-archive-contents)
          (unless (assq (car elt) old-archives)
            (push (car elt) new-packages)))
        (setq result-prev (list new-packages package-archive-contents))))
   `(lambda (result)
      (setq package-archive-contents (cadr result))
      (let ((new-packages (car result)))
        ;; Generate the Package Menu.
        (let ((buf (get-buffer-create "*Packages*")))
          (with-current-buffer buf
            (package-menu-mode)
            (set (make-local-variable 'package-menu--new-package-list)
                 new-packages)
            (package-menu--generate nil t))
          ;; The package menu buffer has keybindings.  If the user types
          ;; `M-x ab/list-packages', that suggests it should become current.
          (switch-to-buffer buf))

        (let ((upgrades (package-menu--find-upgrades)))
          (if upgrades
              (message "%d package%s can be upgraded; type `%s' to mark %s for upgrading."
                       (length upgrades)
                       (if (= (length upgrades) 1) "" "s")
                       (substitute-command-keys "\\[package-menu-mark-upgrades]")
                       (if (= (length upgrades) 1) "it" "them"))))))))

(provide 'package-part)


