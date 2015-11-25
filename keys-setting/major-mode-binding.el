(provide 'major-mode-binding)
;; --------------------------------------------------------------------
;; provide local each major mode key binding
;; each local major-mode key binding 主mode下的键绑定
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
;; (define-key flyspell-mode-map (kbd "C-.") 'switch-to-next-buffer)
;; (define-key flyspell-mode-map (kbd "C-,") 'switch-to-prev-buffer)
;; (define-key flyspell-mode-map (kbd "C-;") 'move-forward-by-five)

;; define lisp-interaction-mode-map
;; (define-key lisp-interaction-mode-map (kbd "C-j") 'switch-to-buffer)
(define-key lisp-interaction-mode-map (kbd "C-j") 'helm-buffers-list)
(define-key lisp-interaction-mode-map (kbd "C-x j") 'eval-print-last-sexp)

;; define emacs-lisp-mode-map
(define-key emacs-lisp-mode-map (kbd "C-x j") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-x SPC")  'ace-jump-mode)
;;(add-hook emacs-lisp-mode-hook 'yas-minor-mode)

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

;; ielm hook key-bindings.
(add-hook 'inferior-emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'helm-buffers-list)))
(add-hook 'ielm-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'helm-buffers-list)))

;; define the latex-mode and bibtex-mode
;; define latex-mode-map local binding
;;(define-key latex-mode-map (kbd "C-j")  'switch-to-buffer)
;; (eval-after-load 'latex
;;   '(define-key LaTeX-mode-map 
;;      (kbd "C-x j")  'ab/latex-compile-current-file))
;;(define-key latex-mode-map (kbd "C-c i")  'ab/latex-insert-marker)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c i")  'ab/latex-insert-marker)
            (local-set-key (kbd "C-x j")  'ab/latex-compile-current-file)))

;; (add-hook 'LaTeX-mode-hook
;;           (lambda () 
;;             (local-set-key (kbd "C-j") 'switch-to-buffer)
;;             (local-set-key (kbd "C-x j") 'ab/latex-compile-current-file)))

;;define bibtex-mode-hook
(add-hook 'bibtex-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'switch-to-buffer)
            (local-set-key (kbd "C-x j") 'ab/latex-add-ref)))

;; add auctex mode
(add-hook 'text-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'helm-buffers-list)))
;;            (local-set-key (kbd "C-j") 'switch-to-buffer)))

;; add shell mode
(add-hook 'sh-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x j") 'ab/run-current-file)))

;; add racket mode
;;(add-hook 'racket-mode-hook 'yas-minor-mode)

;; for javasscript mode
(add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'helm-buffers-list)
            (local-set-key (kbd "M-j") 'helm-find-files)))

(add-hook 'compilation-mode-hook
          (lambda ()
            (local-set-key (kbd "C-o") 'other-window)))
