(define tolerance 0.000001)

(define (average x y)
	(/ (+ x y) 2))

(define (average-damp f)
	(lambda (x) (average x (f x))))

(define (fixed-pointed f first-guess)
	(define (good-enough? pre-value curr-value)
		(< (abs (- pre-value curr-value)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			 (if (good-enough? guess next)
			 	next
			 	(try next))))
	(try first-guess))

(define (square x) (* x x))

(define (pow base n)
	(cond ((= n 0) 1)
		  ((even? n) (square (pow base (/ n 2))))
		  (else (* base (pow base (- n 1))))))

 
(define (damp-times n)
	(floor ((lambda (x) (/ (log x) (log 2))) n)))

(define (compose f g)
	(lambda (x) (f (g x))))

(define (repeated f n)
	(if (< n 1)
		(lambda (x) x)
		(compose f (repeated f (- n 1)))))

(define (nth-root n x)
	(fixed-pointed ((repeated average-damp (damp-times n)) 
					 (lambda (y) (/ x (pow y (- n 1))))) 
					1.0))



(nth-root 2 3)