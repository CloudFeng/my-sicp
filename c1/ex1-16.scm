(define (fast-expt b n)
	(fast-expt-iter b n 1))

(define (fast-expt-iter b n product)
	(cond ((= n 0) product)
		  ((even? n) (fast-expt-iter (square b) (/ n 2) product))
		  (else (fast-expt-iter b (- n 1) (* b product)))))

(define (even? n)
	(= (remainder n 2) 0))

(define (square x) (* x x))

(fast-expt 2 3)
