(define tolerance 0.0001)

(define dx 0.000001)

(define (fixed-point f first-guess)
	(define (good-enough? pre-value curr-value)
		(< (abs (- pre-value curr-value)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			 (if (good-enough? guess next)
			 	next
			 	(try next))))
	(try first-guess))

(define (deriv g)
	(lambda (x) (/ (- (g (+ x dx)) (g x))
	   dx)))

(define (newton-transform g)
	(lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
	(lambda (x) (+ (cube x) 
				   (* a (square x))
				   (* b x)
				   c)))

(define (fixed-point-of-cubic a b c)
	(newtons-method (cubic a b c) 1))

(fixed-point-of-cubic 1 -1 -4)
