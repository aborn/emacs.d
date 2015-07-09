;; 一些常用的os命令
(provide 'os-utils)

(defun ab/get-ip (arg)
  "Get the current buffer's file name"
  (interactive "P")
  (insert (shell-command-to-string "ifconfig |egrep \"10\\.|172\\.|192\\.\" |awk '{print $2}'")))
