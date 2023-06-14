#lang racket

;; GOAL: convert s-expression html to
;; calls to this function:
;   (create-element component #:props [props null] . children)

;; Example code:
; (define (app props ..)
;     (<el "div"
;         #:props ($/obj [className "App"])
;         (<el header)
;         (<el gif-controller #:props ($/obj [src "./res/cat_dancing.webm"]))))

; (define test-element
;     (sexp->element `(div ([className "test"]))))

