;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 这里放的是从 Marmalade and MELPA 安装的包
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'use-package)
(setq use-package-verbose t)

;; --------------------------------------------------------------------
;; exec-path-from-shell
;; https://github.com/purcell/exec-path-from-shell
;; --------------------------------------------------------------------
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'package-part)
