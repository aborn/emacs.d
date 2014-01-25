;;;; script to add WuBi phrases.  Run this command:
;;;; emacs --batch -l update.el


;; setup the environment 
(setq load-path
      (append (list "./") load-path))

(require 'wubi)
(register-input-method
 "chinese-wubi" "Chinese-GB" 'quail-use-package
 "wubi" "wubi"
 "wubi")

(set-language-environment "chinese-gb")
(setq default-input-method "chinese-wubi")

;; set the file name of local phrases
(setq wubi-phrases-file "./wubi-phrases.txt")
(setq wubi-phrases-file-el "./wubi-phrases.el")

;; add local phrases
(wubi-load-local-phrases)

(activate-input-method "chinese-wubi")

;; update WuBi_rules.el[c]
(wubi-save-rules-default)

