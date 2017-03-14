;ex1.21

(define (samllest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divisors? n test-divisor) test-divisor)
		  (else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))

(define (divisors? n test-divisor)
	(= (remainder n test-divisor) 0))

;test
(samllest-divisor 199) ; 199

(samllest-divisor 1999) ;1999

(samllest-divisor 19999) ; 7
