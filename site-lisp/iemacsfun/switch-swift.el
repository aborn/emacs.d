;; switch buffer quickly and fast find another buffer
(provide 'switch-swift)

(defun switch-to-shell-buffer (arg)
"Swith to *shell* buff"
(interactive "p")
(switch-to-buffer "*shell*"))
