(provide 'insert-string)

(defun insert-email-address (arg)
  "Insert email address at the current ponit"
  (interactive "p")
  (unless (boundp 'email-address)   ;; check variable defined.
    (setq email-address "aborn.jiang@foxmail.com"))
  (insert-string email-address))

(defun insert-name-english (arg)
  "Insert english name at the current ponit"
  (interactive "p")
  (unless (boundp 'english-name)
    (setq english-name  "Aborn Jiang"))
  (insert-string english-name))

(defun insert-name-chinese (arg)
  "Insert english name at the current ponit"
  (interactive "p")
  (unless (boundp 'chinese-name)
    (setq chinese-name  "蒋国宝"))
  (insert-string chinese-name))
