(define (fast-multi a b)
	(fast-multi-iter a b 0))

(define (fast-multi-iter a b product)
	(cond ((= b 0) product)
		  ((even? b) (fast-multi-iter (double a) (halve b) product))
		  (else (+ a (fast-multi-iter a (- b 1) product)))))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(fast-multi 2 3)

(fast-multi 2 2)
