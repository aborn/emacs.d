(defun move-middle-of-line ()
  "Move point to the middle of line that is displayed" 
  (interactive)
  (message "move to middle of line")
  (beginning-of-line)
  (forward-char 40))

