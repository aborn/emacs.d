;; switch buffer quickly and fast find another buffer
(provide 'switch-swift)

(defun switch-to-shell-buffer (arg)
  "Swith to *shell* buff"
  (interactive "p")
  (unless (boundp 'shell-name)
    (setq shell-name "shell"))
  (when (string= shell-name "shell")
    (switch-to-buffer "*shell*"))
  (when (string= shell-name "eshell")
    (switch-to-buffer "*eshell*")))
