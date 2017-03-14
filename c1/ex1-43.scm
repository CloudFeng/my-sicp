(define (compose f g)
	(lambda (x) (f (g x))))

(define (desc x) (- x 1))

(define (repeated f n)
	(if (< n 1)
		(lambda (x) x)
		(compose f (repeated f (- n 1)))))

((repeated square 2) 5)