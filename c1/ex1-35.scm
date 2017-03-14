(define tolerance 0.0001)

(define (fixed-point f first-guess)
	(define (close-enough? lhs rhs)
		(< (abs (- lhs rhs)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

;x->1+1/x
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)