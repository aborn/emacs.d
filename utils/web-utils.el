(defconst mm-url-unreserved-chars
  '(?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?k ?l ?m ?n ?o ?p ?q ?r ?s ?t ?u ?v ?w ?x ?y ?z
       ?A ?B ?C ?D ?E ?F ?G ?H ?I ?J ?K ?L ?M ?N ?O ?P ?Q ?R ?S ?T ?U ?V ?W ?X ?Y ?Z
       ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9
       ?- ?_ ?. ?! ?~ ?* ?' ?\( ?\))
  "A list of characters that are _NOT_ reserved in the URL spec.
This is taken from RFC 2396.")

;; http://www.gnu.org/software/emacs/manual/html_node/elisp/String-Conversion.html
;; 查某个character的unicode ?a 反之 (byte-to-string 97)

;; 根据RFC1738 https://www.ietf.org/rfc/rfc1738.txt
;; 通用的special characters有这些 "$-_.+!*'(),"
;; 但java里只用了 ".", "-", "*", and "_"
;;               46   45   42      95
;; 见: http://docs.oracle.com/javase/7/docs/api/java/net/URLEncoder.html

;; 注意：默认的elisp里的 url-unreserved-chars
;; a-zA-Z0-9 及 special-characters 为 "-" "_" "." "~"
;;                                    45  95  46 126
;; 

(defconst java-special-characters '(?. ?- ?* ?_))
;; 把系统的url-unreserved-chars值back起来
(setq ab/bak-url-unreserved-chars url-unreserved-chars)

;; 按java的格式编码url
(defun ab/url-encode-java (url)
  (interactive)
  (setq tmp-url-unreserved-chars (remove '126 url-unreserved-chars))
  (add-to-list 'tmp-url-unreserved-chars '42)
  (setq url-unreserved-chars (remove-duplicates tmp-url-unreserved-chars))
  (url-hexify-string url))

;; 按elisp的默认方式编码url
(defun ab/url-encode-default (url)
  (setq url-unreserved-chars ab/bak-url-unreserved-chars)
  (url-hexify-string url))

(provide 'web-utils)
