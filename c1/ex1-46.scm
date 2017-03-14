(define tolerance 0.000001)

(define (good-enough? pre-value curr-value)
	(< (abs (- pre-value curr-value)) tolerance))

;若是写成 (iterative-improve good-enough? improve)，会报错，说good-enough? 需要两个参数
(define (iterative-improve improve good-enough?)
	(lambda (x) (let ((next (improve x)))
					(if (good-enough? x next)
					 	next
						((iterative-improve improve good-enough?) next)))))

 (define (sqrt x)
 	(define (improve guess)
 		(/ (+ guess (/ x guess)) 2))
   ((iterative-improve  improve good-enough?) 1.0)) 

(sqrt 2)
	
(define (fixed-point f first-guess)
	((iterative-improve f good-enough?) first-guess))


(define (average-damp f)
	(lambda (x) (/ (+ x (f x)) 2)))

(define (sqrt-average-damp x)
	(fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(sqrt-average-damp 2)