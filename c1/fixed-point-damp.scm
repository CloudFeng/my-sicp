(define tolerace 0.0001)

(define (fixed-point f first-guess)
	(define (good-enough? pre-value curr-value)
		(< (abs (- pre-value curr-value)) tolerace))
	(define (try guess)
		(let ((next (f guess)))
			(if (good-enough? guess next)
				next
				(try next))))
	(try first-guess))

(define (average x y) (/ (+ x y) 2))

;(x + f(x))/2
(define (average-damp f)
	(lambda (x) (average x (f x))))

;y|-->(x+x^2)/2
((average-damp square) 10)

;test
(define (sqrt x)
	(fixed-point (lambda (y) (/ (+ y (/ x y)) 2)) 1.0))

(sqrt 2)

(define (sqrt-damp x)
	(fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(sqrt-damp 2)