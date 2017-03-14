(define (factorial n)
	(factor-iter 1 1 n))

(define (factor-iter product counter max-counter)
	(if (> counter max-counter)
		product
		(factor-iter (* product counter) (+ counter 1) max-counter)))

(factorial 3)