(provide 'emacs-nifty-tricks)

(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%Y-%m-%d")
                 ((equal prefix '(4)) "%Y-%m-%d")
                 ((equal prefix '(16)) "%A, %d. %B %Y")))
        (system-time-locale "de_DE"))
    (insert (format-time-string format))))

(defun insert-date-format (format)
  "Wrapper around format-time-string." 
  (interactive "MFormat: ")
  (insert (format-time-string format)))


(defun insert-standard-date ()
  "Inserts standard date time string." 
  (interactive)
  (insert (format-time-string "%c")))

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
