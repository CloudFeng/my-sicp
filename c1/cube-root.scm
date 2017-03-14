(define tolerance 0.0001)

(define (fixed-point f first-guess)
	(define (good-enough? pre-value curr-value)
		(< (abs (- pre-value curr-value)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			 (if (good-enough? guess next)
			 	next
			 	(try next))))
	(try first-guess))

(define (average x y)
	(/ (+ x y) 2))

(define (average-damp f)
	(lambda (y) (average y (f y))))

(define (cube-root x)
	(fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))

(cube-root 27)