;ex1-34
(define (f g)
	(g 2))

(define (square x) (* x x))
(f square)

(f (lambda (x) (* x (+ x 1))))

(f f)

;(f f) --> (f 2) --> (2 2)