;ex1-27

(define (square x) (* x x))

; base^exp % m
(define (expmod base ex m)
	(cond ((= ex 0) 1)
		  ((even? ex) (remainder (square (expmod base (/ ex 2) m)) m))
		  (else (remainder (* base (expmod base (- ex 1) m)) m))))

(define (full-fermat-test a n)
	(cond ((= a n) true)
		  ((= (expmod a n n) a) (full-fermat-test (+ a 1) n))
		  (else false)))

(define (fast-prime? n)
	(if (<= n 0)
		false
		(full-fermat-test 1 n))

;test
(fast-prime? 561)
