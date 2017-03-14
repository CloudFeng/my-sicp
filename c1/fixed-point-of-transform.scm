(define tolerance 0.0001)

(define dx 0.000001)

(define (average x y)
	(/ (+ x y) 2))

(define (fixed-point f first-guess)
	(define (good-enough? pre-value curr-value)
		(< (abs (- pre-value curr-value)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			 (if (good-enough? guess next)
			 	next
			 	(try next))))
	(try first-guess))

(define (average-damp g)
	(lambda (x) (average x (g x))))

(define (deriv g)
	(lambda (x)
		(/ (- (g (+ x dx))
			  (g x))
		   dx)))

;f(x)=x - (g(x)-Dg(x))
(define (newton-transform g)
	(lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

(define (fixed-point-of-transform g transform guess)
	(fixed-point (transform g) guess))

(define (square x)
	(* x x))

;y|->y^2-x
(define (sqrt-newton-method x)
	;(newtons-method (lambda (y) (- (square y) x)) 1.0)
	(fixed-point-of-transform 
		(lambda (y) (- (square y) x))
		newton-transform
		1.0))

(define (sqrt-average-damp x)
	;(fixed-point (average-damp (lambda (y) (/ x y))) 1.0)
	(fixed-point-of-transform
		(lambda (y) (/ x y))
		average-damp
		1.0))


(sqrt-newton-method 2)
(sqrt-average-damp 2)
