#! /usr/bin/env racket
#lang racket
(require web-server/servlet
         web-server/servlet-env)
 
(define (my-app req)
  (response/xexpr
   `(html (head (title "Hello world!"))
          (body (p "Hey out there!")))))

(serve/servlet my-app
               #:extra-files-paths
               (list
                (build-path "/Users/aborn/.emacs.d/code/racket"))
               )
;(serve/servlet start)
