;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multi-term emacs terminal config
;; emacs terminal 终端配置，在multi-term.el的基础上进行了优化
;;   注：multi-term 采用的是 term-mode 这种模式有两种子模式
;;     一种是 (term-char-mode) 像普通的shell
;;     另一种是 (term-line-mode) 像普通的buffer
;; 见： http://www.gnu.org/software/emacs/manual/html_node/emacs/Term-Mode.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'multi-term-config)
(require 'multi-term)

;; 一些基本配置
(setq multi-term-program "/bin/zsh")
(add-to-list 'term-bind-key-alist '("C-j"))
(add-to-list 'term-bind-key-alist '("C-o"))
(add-to-list 'term-bind-key-alist '("C-e"))
(add-to-list 'term-bind-key-alist '("C-f"))
(add-to-list 'term-bind-key-alist '("C-k"))
(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
	(if (eq 'term-mode (with-current-buffer (car l) major-mode))
		(car l) (last-term-buffer (cdr l)))))

;; 获得multi-term
(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
	(if (or (not b) (eq 'term-mode major-mode))
		(multi-term)
	  (switch-to-buffer b))))

;; 只后当是term-mode并且是最后一行时才采用 (term-send-left)
(defun ab/backward-char ()
  "Custom "
  (interactive)
  (if (not (ab/is-term-mode))
	  (backward-char)
	(progn (if (not (ab/is-at-end-line))
               (backward-char)
             (progn (term-send-left)
                    (message "term-send-left"))))))

;; 当处于最后一行时 "C-a" 将光标移动到 terminal开始处而不是这个行的头
(defun ab/move-beginning-of-line ()
  "move begin"
  (interactive)
  (if (not (ab/is-term-mode))
      (beginning-of-line)
    (if (not (ab/is-at-end-line))
        (beginning-of-line)
      (term-send-raw))))

;; TODO 暂时没用
(defun ab/move-end-of-line ()
  "move end of line"
  (interactive)
  (message "here")
  (end-of-line)
  (when (and (ab/is-at-end-line) (ab/is-term-mode))
    (progn (term-char-mode)
           (message "change to char mode"))))

(defun ab/is-at-end-line ()
  "判断是否在最后一行"
  (equal (line-number-at-pos) (count-lines (point-min) (point-max))))

(defun ab/is-term-mode ()
  "判断是否为 term 模式"
  (string= major-mode "term-mode"))

(defun ab/debug ()
  "debug时用"
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

;; 下面设置一些快捷键
(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
			(add-to-list 'term-bind-key-alist '("C-d" . delete-char))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-bind-key-alist '("C-a" . ab/move-beginning-of-line))
			(add-to-list 'term-bind-key-alist '("C-b" . ab/backward-char))
			(setq show-trailing-whitespace nil)))

