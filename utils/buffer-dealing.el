(provide 'buffer-dealing)

(defun buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
    major-mode))

(defun get-buffer-mode-name (buffer-or-string)
  "Get the buffer major mode name."
  (interactive "bBuffer Name:")
  (message (with-current-buffer buffer-or-string
             major-mode)))

(defun get-current-file-name (arg)
  "Get the current buffer's file name"
  (interactive "P")
  (message (buffer-file-name (current-buffer)))) 

(defun switch-buffer-each-other (arg)
  "switch current buffer with other window buffer 
   right-2-left or left-2-right"
  (interactive "p")
  (if (windmove-find-other-window 'right)
      (buf-move-right)
    (buf-move-left))
    (other-window 1)
  )

(defalias 'swap-buffer 'switch-buffer-each-other)

(defun ab-kill-buff (arg)
  "my defined kill-buff related with ecb"
  (interactive "P")
  (ab/ecb-deactivate)
  (kill-buffer)
  (ab/ecb-activate))

(defun buffer-exists (bufname)   
  (not (eq nil (get-buffer bufname))))

(defun make-eshell (name)
  "Create a new eshell buffer named NAME."
  (interactive "sName: ")
  (if (buffer-exists "*eshell*")
      (setq eshell-buffer-name name)
    (message "eshell doesnot exists, use the default name: *eshell*"))
  (eshell))

(defun make-bshell (name)
  "Create a default shell buffer named NAME"
  (interactive "sName: ")
  (unless (buffer-exists "*shell*")
    (message "eshell doesnot exists, use the default name: *eshell*")
    (setq name "*shell*"))
  (shell name))

(defun make-shell (name)
  "Create a shell(or eshell) buffer named NAME"
  (interactive "sName: ")
  (cond ((string= shell-name "eshell")
        (make-eshell name)
        (message "make eshell."))
       ((string= shell-name "shell")
        (make-bshell name)
        (message "make default shell."))
       ))

(defun ab/shell-buffer? ()
  "return t if the current buffer is shell buffer"
  (setq bfname (ab/get-current-window-buffer-name))
  (if (string-match "shell" bfname)
      (message bfname)      ;; show shell name if it is a shell
    nil                     ;; or return nil
    ))

(defun ab/switch-to-shell-buffer (arg)
  "Swith to *shell* buff"
  (interactive "p")
  (select-window (ab/get-window-at-right-botton))
  (unless (ab/shell-buffer?)
    (unless (get-buffer (ab/get-default-shell-buffer-name))
      (make-shell (ab/get-default-shell-buffer-name)))
    (switch-to-buffer (ab/get-default-shell-buffer-name)))
  (end-of-buffer))

;; -----------------------------------------------------------------
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
;; -----------------------------------------------------------------
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defalias 'ab/buffer-exists 'buffer-exists)
(defalias 'ab/shell 'make-shell)
(defalias 'ab/rename 'rename-file-and-buffer)
(defalias 'ab/kill-buff 'ab-kill-buff)
