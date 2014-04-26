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
  )

