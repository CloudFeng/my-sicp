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
	(lambda (x)
		(/ (- (g (+ x dx))
			  (g x))
		   dx)))

(define (cube x) (* x x x))
((deriv cube) 5)

;f(x)=x - (g(x)-Dg(x))
(define (newton-transform g)
	(lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))


(define (square x)
	(* x x))

;y|->y^2-x
(define (sqrt x)
	(newtons-method (lambda (y) (- (square y) x)) 1.0))

(sqrt 2)
