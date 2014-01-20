(defun move-middle-of-line ()
  "Move point to the middle of line current displayed" 
  (interactive)
  (message "move to middle of line, cur=%d." (current-column))
  (end-of-line)
  (backward-char (/ (current-column) 2)))

