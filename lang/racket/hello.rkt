#! /usr/bin/env racket

#lang racket

(define (extract str)
  (substring str 4 7))

(extract "the cat out of the bag")

(if (file-exists? "~/dpcode/eta/indextabicon/category.txt")
    "category.txt exist!"
    "category.txt not find")

(directory-exists? "/Users/aborn/dpcode")

