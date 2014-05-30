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

(defun ab-kill-buff (arg)
  "my defined kill-buff related with ecb"
  (interactive "P")
  (ab/ecb-deactivate)
  (kill-buffer)
  (ab/ecb-activate))

(defun buffer-exists (bufname)   
  (not (eq nil (get-buffer bufname))))

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
(defalias 'swap-buffer 'switch-buffer-each-other)
