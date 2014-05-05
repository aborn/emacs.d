(provide 'major-mode-binding)
;; --------------------------------------------------------------------
;; provide local each major mode key binding
;; each local major-mode key binding 
;; --------------------------------------------------------------------
;; define matlab-mode key-binding
(require 'matlab)
(define-key matlab-mode-map (kbd "C-j") 'switch-to-buffer)
(define-key matlab-mode-map (kbd "M-j") 'find-file)
(define-key matlab-mode-map (kbd "C-x j") 'matlab-shell-save-and-go)
(define-key matlab-mode-map (kbd "C-x SPC")  'ace-jump-mode)

;; define php-mode key-binding
(require 'php-mode)
(define-key php-mode-map (kbd "M-j") 'find-file)

;; define flyspell-mode-map
(define-key flyspell-mode-map (kbd "C-.") 'switch-to-next-buffer)
(define-key flyspell-mode-map (kbd "C-,") 'switch-to-prev-buffer)
(define-key flyspell-mode-map (kbd "C-;") 'move-forward-by-five)

;; define markdown-mode-map
(define-key markdown-mode-map (kbd "\C-c\C-k") 'start-kbd-macro)
(define-key markdown-mode-map (kbd "\C-x SPC") 'ace-jump-mode)


;; define lisp-interaction-mode-map
(define-key lisp-interaction-mode-map (kbd "C-j") 'switch-to-buffer)
(define-key lisp-interaction-mode-map (kbd "C-x j") 'eval-print-last-sexp)

;; define emacs-lisp-mode-map
(define-key emacs-lisp-mode-map (kbd "C-x j") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-x SPC")  'ace-jump-mode)

;; define scheme-mode-map 
(define-key scheme-mode-map (kbd "C-x j") 'xscheme-send-buffer)


;; define shell-mode-map
(define-key shell-mode-map (kbd "C-x SPC")  'ace-jump-mode)
(define-key shell-mode-map (kbd "C-c SPC")  'ace-jump-mode)

;; define matlab-shell--mode-map
;; (require 'matlab-shell-mode)
;; NOTE, the initial matlab-shell-mode-map can't be nil (empty)
(unless matlab-shell-mode-map
  (setq matlab-shell-mode-map (make-sparse-keymap))
  (define-key matlab-shell-mode-map (kbd "C-c SPC")  'ace-jump-mode)
  (define-key matlab-shell-mode-map (kbd "C-x SPC")  'ace-jump-mode)
  (define-key matlab-shell-mode-map (kbd "RET") 'comint-send-input)
  (define-key matlab-shell-mode-map (kbd "C-c C-c") 'comint-interrupt-subjob)
  (define-key matlab-shell-mode-map (kbd "M-p") 'comint-previous-input)
  (define-key matlab-shell-mode-map (kbd "M-n") 'comint-next-input)
  )

;; define geiser-repl-mode-map
;;(define-key geiser-repl-mode-map (kbd "C-j") 'switch-to-buffer)

;; (unless inferior-emacs-lisp-mode-map
;; (setq inferior-emacs-lisp-mode-map (make-sparse-keymap))
;; )

(add-hook 'inferior-emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'switch-to-buffer)))

