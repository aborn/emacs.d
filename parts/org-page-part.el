(require 'org-page)
(setq op/repository-directory "~/github/blog.aborn.me")   ;; the repository location
(setq op/site-domain "http://aborn.me/")         ;; your domain

(setq op/site-main-title "aborn")
(setq op/site-sub-title "思考创造个性，个性成就自我！")
(setq op/personal-github-link "https://github.com/aborn")
(setq op/personal-avatar nil)

(setq op/repository-org-branch "source") ;; default is "source"
(setq op/repository-html-branch "gh-pages")  ;; default is "master"
;; (setq op/personal-avatar "http://m1.s1.dpfile.com/sc/api_res/weather/found_cloud.jpg")
(setq op/personal-duoshuo-shortname "aborn")   ;; your duoshuo commenting system

(op/do-publication t nil nil t)
(provide 'org-page-part)
