(provide 'multi-term-config)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(add-to-list 'term-bind-key-alist '("C-j"))
(add-to-list 'term-bind-key-alist '("C-o"))
;;(add-to-list 'term-bind-key-alist '("C-a"))
(add-to-list 'term-bind-key-alist '("C-e"))
(add-to-list 'term-bind-key-alist '("C-f"))
(add-to-list 'term-bind-key-alist '("C-b"))
(add-to-list 'term-bind-key-alist '("C-k"))
(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
	(if (eq 'term-mode (with-current-buffer (car l) major-mode))
		(car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
	(if (or (not b) (eq 'term-mode major-mode))
		(multi-term)
	  (switch-to-buffer b))))

(defun ab/backward-char ()
  "Custom "
  (interactive)
  (if (not (string= major-mode "term-mode"))
	  (backward-char)
	(progn (backward-char)
           (when (ab/is-at-end-line)
             (term-line-mode)
             (message "change to line mode")))))

(defun ab/move-beginning-of-line ()
  "move begin"
  (interactive)
  (if (not (ab/is-term-mode))
      (beginning-of-line)
    (if (not (ab/is-at-end-line))
        (beginning-of-line)
      (term-send-raw))))

    ;; (unless (and (ab/is-at-end-line) (string= major-mode "term-mode"))
    ;;   (message "good move to begin")
    ;;   (move-beginning-of-line)))

(defun ab/move-end-of-line ()
  "move end of line"
  (interactive)
    (message "here")
  (end-of-line)
  (when (and (ab/is-at-end-line) (ab/is-term-mode))
    (progn (term-char-mode)
           (message "change to char mode"))))

(defun ab/is-at-end-line ()
  ""
  ;;(message "line number:%d  %d %d" (line-number-at-pos) (point) (point-max))
  (equal (line-number-at-pos) (count-lines (point-min) (point-max))))

(defun ab/is-term-mode ()
  ""
  (string= major-mode "term-mode"))

(defun ab/msg ()
  ""
  (interactive)
  (if (ab/is-term-mode)
      (message "是term mode")
    (message "不是term mode")))

;; Use Emacs terminfo, not system terminfo, mac系统出现了4m
(setq system-uses-terminfo nil)
;; 下面设置multi-term buffer的长度无限
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 0)))
(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
			(add-to-list 'term-bind-key-alist '("C-d" . delete-char))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-bind-key-alist '("C-a" . ab/move-beginning-of-line))
;;			(add-to-list 'term-bind-key-alist '("C-b" . ab/backward-char))
;;            (add-to-list 'term-bind-key-alist '("C-e" . ab/move-end-of-line))
			(setq show-trailing-whitespace nil)))

