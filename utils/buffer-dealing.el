(provide 'buffer-dealing)

(defun buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."

  (with-current-buffer buffer-or-string
    major-mode))

;; (defun get-buffer-mode-name (buffer-or-string)
;;   "Get the buffer major mode name."
;;   (interactive "bBuffer Name:")
;;   (message (buffer-mode buffer-or-string)))

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
  (ecb-deactivate)
  (kill-buffer)
  (ecb-activate))

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
