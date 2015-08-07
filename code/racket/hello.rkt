#! /usr/bin/env racket

#lang racket

(define (extract str)
  (substring str 4 7))

(extract "the cat out of the bag")

(file-exists? "~/dpcode/eta/indextabicon/category.txt")
(directory-exists? "/Users/aborn/dpcode")

