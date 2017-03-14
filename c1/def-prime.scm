; 素数检测
(define (samllest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divisor? test-divisor n) test-divisor)
		  (else (find-divisor n (+ test-divisor 1)))))

(define (divisor? test-divisor n)
	(= (remainder n test-divisor) 0))

(define (square x) (* x x))

(define (prime? n)
	(= n (samllest-divisor n)))


;test
(prime? 2)

(samllest-divisor 9)

(prime? 9)

(prime? 7)