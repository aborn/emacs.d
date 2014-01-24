(provide 'move-swift)
(defun move-middle-of-line (arg)
  "Move point to the middle of line current displayed" 
  (interactive "p")
  (push-mark)
  (message "move to middle of line, cur=%d." (current-column))
  (end-of-line)
  (backward-char (/ (current-column) 2)))

(defun move-forward-by-five (arg)
  "Move point forward by five lines"
  (interactive "p")
  (push-mark)
  (forward-line 5))

(defun move-backward-by-five (arg)
"Move point backward by five lines"
  (interactive "p")
  (push-mark)
  (forward-line -5))
