(define tolerance 0.00001)

(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? next guess)
				next
				(try next))))
	(try first-guess))

; cos x = x
(fixed-point cos 1.0)

;y = sin y + cos y
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

;y=sqrt x ==> y = x/y
;(define (sqrt x)
;	(fixed-point (lambda (y) (/ x y)) 1.0))

; y = (y + x / y) / 2
(define (sqrt x)
	(fixed-point (lambda (y) (/ (+ y (/ x y)) 2)) 1.0))
(sqrt 3)