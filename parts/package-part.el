;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 这里放的是从 Marmalade and MELPA 安装的包
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; --------------------------------------------------------------------
;; exec-path-from-shell
;; https://github.com/purcell/exec-path-from-shell
;; --------------------------------------------------------------------
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'package-part)
