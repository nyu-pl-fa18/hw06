#lang scheme

#| Homework 6

Replace each '??? with your implementation of the corresponding function. If
you are asked to define a tail-recursive function, you are allowed to define
auxiliary helper functions at the top-level using 'define'. Alternatively,
define the helper functions in a nested scope using `letrec`.

At the end of the file, several unit tests are given. If you run the file in
DrRacket, and you end up with the prompt > and don't see any output,
then all tests have passed. If a test fails, then you will see one or
more error messages. If one of your functions does not terminate,
you will not see the command prompt > after clicking 'Run'.

|#


; Problem 1

; Part 1: unzip
(define (unzip xys) '???)


; Part 2: flatten
(define (flatten xs) '???)


; Problem 2

; Part 1: unzip-alt
(define (unzip-alt xys) '???)


; Part 2: foldr-alt
(define (foldr-alt op z xs) '???)


; Part 3: in-relation
(define (in-relation p xs) '???)


; Unit tests

(require rackunit)

; unzip
(check-equal?
 (unzip '((1 . a) (2 . b) (3 . c)))
 '((1 2 3) . (a b c)))
(check-equal?
 (unzip '((1 . 2)))
 '((1) . (2)))
(check-equal?
 (unzip '())
 '(() . ()))

; flatten
(check-equal?
 (flatten 1)
 '(1))
(check-equal?
 (flatten (cons 1 2))
 '((1 . 2)))
(check-equal?
 (flatten `(1 2 3))
 '(1 2 3))
(check-equal?
 (flatten `(1 (3 4) 5))
 '(1 3 4 5))
(check-equal?
 (flatten '(1 (2 3 (4 5) (6 7 (8)) 9) 10))
 '(1 2 3 4 5 6 7 8 9 10))

; unzip-alt
(check-equal?
 (unzip-alt '((1 . a) (2 . b) (3 . c)))
 '((1 2 3) . (a b c)))
(check-equal?
 (unzip-alt '((1 . 2)))
 '((1) . (2)))
(check-equal?
 (unzip-alt '())
 '(() . ()))

; foldr-alt
(check-equal?
 (foldr-alt + 0 '(1 2 3))
 6)
(check-equal?
 (foldr-alt + 0 '())
 0)
(check-equal?
 (foldr-alt cons '() '(1 2 3))
 '(1 2 3))
(check-equal?
 (foldr-alt cons '() '())
 '())
(check-equal?
 (foldr-alt (lambda (hd res) (cons (+ hd 1) res)) '() '(1 2 3))
 '(2 3 4))

; in-relation
(check-equal?
 (in-relation < '(1 2 3 5 6))
 #t)
(check-equal?
 (in-relation < '(1))
 #t)
(check-equal?
 (in-relation < '())
 #t)
(check-equal?
 (in-relation < '(1 3 2))
 #f)
(check-equal?
 (in-relation eq? '(1 1 1))
 #t)
(check-equal?
 (in-relation eq? '(1 1 2))
 #f)
(check-equal?
 (in-relation (lambda (x y) (eq? y (+ x 1))) '(1 2 3))
 #t)
(check-equal?
 (in-relation (lambda (x y) (eq? y (+ x 1))) '(1 2 4))
 #f)
