(defun move-middle-of-line (arg)
  "Move point to the middle of line current displayed" 
  (interactive "p")
  (push-mark)
  (message "move to middle of line, cur=%d." (current-column))
  (end-of-line)
  (backward-char (/ (current-column) 2)))

