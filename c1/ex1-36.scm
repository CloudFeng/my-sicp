(define tolerance 0.0001)
(define (fixed-point f first-guess)
	(define (close-enough? lhs rhs)
		(< (abs (- lhs rhs)) tolerance))
	(define (try guess)
		(print guess)
		 (let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

(define (print x)
	(display x)
	(newline))


(define (average x y)
	(/ (+ x y) 2))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 10)

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10.0)
