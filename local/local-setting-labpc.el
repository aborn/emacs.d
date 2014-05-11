(provide 'local-setting)

;; setting color-theme
(require 'dream-theme)
(setq highlight-tail-colors '(("black" . 0)
							  ("#bc2525" . 25)
							  ("black" . 66)))

;; setting frame/window
;; (require 'frame-cmds)   ;; frame-cmds packages has some problem
;; (maximize-frame)

;; open ecb windows
(setq ecb-auto-activate t
      ecb-tip-of-the-day nil)

;; setting emacsclient remote open file
(defun server-start-and-copy ()
  "start server and copy auth files"
  (when (and (fboundp 'server-running-p)   ; function exists.
             (not (server-running-p)))
    (server-start)                       ; emacs as server mode
    (when (file-exists-p "/lisp@yoks:~/.emacs.d/server/server")
      (delete-file "/lisp@yoks:~/.emacs.d/server/server"))
    (copy-file "~/.emacs.d/server/server" "/lisp@yoks:~/.emacs.d/server/server")
    ))
(add-hook 'emacs-startup-hook 'server-start-and-copy)
