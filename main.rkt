#lang racket

(require (for-syntax racket/match))
;; GOAL: convert s-expression html to
;; calls to this function:
;   (create-element component #:props [props null] . children)

;; Example code:
; (define (app props ..)
;     (<el "div"
;         #:props ($/obj [className "App"])
;         (<el header)
;         (<el gif-controller #:props ($/obj [src "./res/cat_dancing.webm"]))))

; (define-syntax (our-if stx)
;   (match (syntax->list stx)
;    [(list name condition true-expr false-expr)
;     (datum->syntax stx `(cond [(invert-boolean ,condition) (our-if (not ,condition) ,true-expr ,false-expr)]
;                               [else ,false-expr]))]))

; (define example-sexp '("p" "hello world"))

; (displayln example-sexp)

; (match example-sexp
;   [(list tag-name child) (printf "~a ~a\n" tag-name child)]
;   [_ (printf "pattern not matched\n")])

(define-syntax (sexp->html stx)
  (define expr (syntax->datum stx))
  (displayln expr)
  (define (match-expr expr)
    (match expr
      [(? string? str) (datum->syntax stx `(format "~a" ,str))]
      [(? number? num) (datum->syntax stx `(format "~d" ,num))]
      [(list _ (list (app symbol->string tag-name) (app match-expr child))) (datum->syntax stx `(format "<~a>~a</~a>" ,tag-name ,child ,tag-name))]))
  (match-expr expr)
  )

(sexp->html (div (p "hello world")))