(provide 'local-setting)

;; setting color-theme
(require 'dream-theme)
(setq highlight-tail-colors '(("black" . 0)
							  ("#bc2525" . 25)
							  ("black" . 66)))

;;setting frame/window
;; (require 'frame-cmds)   ;; frame-cmds packages has some problem
;; (maximize-frame)

;;(delete-other-windows)             ; keep one window
(sr-speedbar-open)
;;(sr-speedbar-toggle)
(other-window 1)
(split-window-horizontally)      ; keep horizontally two windows

(setq ecb-auto-activate t
      ecb-tip-of-the-day nil)
