(provide 'insert-string)

(defun insert-email-address (arg)
  "Insert email address at the current ponit"
  (interactive "p")
  (unless (boundp 'user-mail-address)   ;; check variable defined.
    (setq user-mail-address "aborn.jiang@foxmail.com"))
  (insert-string user-mail-address))
;;  (insert-string email-address))

(defun insert-name-english (arg)
  "Insert english name at the current ponit"
  (interactive "p")
  (unless (boundp 'user-full-name)
    (setq user-full-name  "Aborn Jiang"))
  (insert-string user-full-name))

(defun insert-name-chinese (arg)
  "Insert english name at the current ponit"
  (interactive "p")
  (unless (boundp 'chinese-name)
    (setq chinese-name  "蒋国宝"))
  (insert-string chinese-name))

(defun insert-buffer-name (arg)
  "Insert buffer name at the current point"
  (interactive "p")
  (insert-string (buffer-name)))

(defun insert-current-time (arg)
  "Insert time to current point"
  (interactive "P")
  (insert-string (current-time-string)))

(defun insert-current-buffer-file-name (arg)
  "Insert current buffer file name (full path)"
  (interactive "P")
  (insert-string (buffer-file-name (current-buffer))))

(defun ab/insert-tab-space (arg)
  "Insert 4 white space in current ponit"
  (interactive "P")
  (insert-string "    "))
