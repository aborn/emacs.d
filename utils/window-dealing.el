(provide 'window-dealing)

(defun ab/get-default-shell-buffer-name ()
  "get default shell buffer name"
  (interactive)
  (unless (boundp 'shell-name)
    (setq shell-name "shell"))
  (cond ((string= shell-name "shell") 
         (message "*shell*"))
        ((string= shell-name "eshell")
         (message "*eshell*")))
  )

(defun ab/get-window-buffer-name (window)
  "get the windows' buffer name"
  (buffer-name (window-buffer window)))

(defun ab/get-current-window-buffer-name ()
  "get the windows' buffer name"
  (interactive)
  (message (buffer-name (window-buffer nil))))

(defun ab/get-next-window-buffer-name ()
  "get next window buffer name and skill ecb window"
  (interactive)
  (setq cw (selected-window))  ;; save current window
  (setq nw (ab/get-window-buffer-name (next-window)))
  (while (or (string= nw " *ECB Directories*")
             (string= nw " *ECB Sources*")
             (string= nw " *ECB Methods*")
             (string= nw " *ECB History*"))
    (setq nw (ab/get-window-buffer-name (next-window)))
    (message nw)
    (select-window (next-window)))
  (select-window cw)          ;; recover current window
  (message nw)
  )

(defun ab/window-normal ()
  "show normal window layout (default)"
  (interactive)
  (setq nwindname (ab/get-next-window-buffer-name))
  (setq nxbfname (buffer-name (next-buffer)))
  (previous-buffer)
  (when (= (count-windows) 7) 
    (throw 'break "already default window layout."))
  (delete-other-windows)
  (setq fswindow (frame-first-window)) ;; fswindow means upper left window
  (setq main-content-wind (window-in-direction 'right fswindow))
  (when (window-valid-p main-content-wind)
    (progn (split-window main-content-wind nil 'right)
           (split-window (window-in-direction 'right main-content-wind) 
                         nil 'below)
           (if (string= (buffer-name) nwindname)
               (set-window-buffer (next-window) nxbfname)
             (set-window-buffer (next-window) nwindname))
           (set-window-buffer (next-window (next-window))  ;; set shell
                              (ab/get-default-shell-buffer-name))
           (message "ecb main content split into default layout.")))
                                        ;  (split-window fswindow nil 'right))

  )

(defun ab/window-two-views ()
  "two windows view"
  (interactive)
  (when (= (count-windows) 6) 
    (throw 'break "already two view winows."))
  (setq nwindname (ab/get-next-window-buffer-name))
  (delete-other-windows)
  (split-window (get-largest-window) nil 'right)
  (if (string= (buffer-name) nwindname)
      (set-window-buffer (next-window) (ab/get-default-shell-buffer-name))
    (set-window-buffer (next-window) nwindname))
  )
