;ex1.23
(define (smallest-divisor n)
	(find-divisor n 2))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divisors? n test-divisor) test-divisor)
		  (else (find-divisor n (next test-divisor)))))

(define (divisors? a b)
	(= (remainder a b) 0))

(define (prime? n)
	(= (smallest-divisor n) n))

(define (next step)
	(if (= step 2)
		(+ step 1)
		(+ step 2)))

