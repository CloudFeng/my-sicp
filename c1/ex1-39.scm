
(define (cont-frac x n d k term)
	(define (cont-frac-iter i result)
		(if (= 0 i)
			result
			(cont-frac-iter (- i 1) 
							(term x n d i result))))
	(cont-frac-iter k 0))

(define (term x n d i result)
	(/ (n i x)
	   (- (d i) result)))

(define (square x) (* x x))

(define (tan-cf x k)
	(cont-frac x 
			 (lambda (i x) (if (= i 1) 
							x
							(square x)))
			  (lambda (i) (- (* 2 i) 1))
			  k
			  term))

(tan-cf 1.0 10)