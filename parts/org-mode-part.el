;; --------------------------------------------------------------------
;; setting org-mode
;; --------------------------------------------------------------------
;; (setq org-todo-keywords
;; '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
(setq org-todo-keywords
	  '((sequence "TODO" "ONGOING" "DONE" "DELEGATED")))
(setq org-log-done 'time)   ;;  setting close time
(setq org-log-done 'note)   ;;  setting a log note
;; (set org-modules 'habits)

(provide 'org-mode-part)
