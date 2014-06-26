;;(require 'eclim)
(setq eclim-auto-save t)
;;(global-eclim-mode)
;; If you want to control eclimd from emacs, also add:
(require 'eclimd)
;; boot the eclimd server by hand run as
;; ~/software/eclipse/eclimd
;; or M-x start-eclim/stop-eclim

(custom-set-variables
 '(eclim-eclipse-dirs '("~/software/eclipse"))    
 '(eclim-executable "~/software/eclipse/eclim"))

;; Displaying compilation error messages in the echo area
;;(setq help-at-pt-display-when-idle t)
;;(setq help-at-pt-timer-delay 0.1)
;;(help-at-pt-set-timer)

;; If you wish to use auto-complete-mode with emacs-eclim, 
;;    add the following to your .emacs:
;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

;; Configuring company-mode
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)
(require 's)
(add-hook 'after-init-hook 'global-company-mode)

(require 'flymake)

(defun my-flymake-init ()
  (list "my-java-flymake-checks"
        (list (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-with-folder-structure))))
(add-to-list 'flymake-allowed-file-name-masks
             '("\\.java$" my-flymake-init flymake-simple-cleanup))

