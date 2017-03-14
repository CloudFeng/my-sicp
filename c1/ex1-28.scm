;ex1-28

(define (square x) (* x x))


; base^exp % m
(define (expmod base ex m)
	(cond ((= ex 0) 1)
		  ((even? ex) (non-trivial-sqrt (expmod base (/ ex 2) m) m))
		  (else (remainder (* base (expmod base (- ex 1) m)) m))))

(define (miller-rabin-test n)
	(define (try-it a)
			(= (expmod a (- n 1) n) 1))
	(try-it (+ 1 (random (- n 1)))))

; orignal
#|
(define (non-trivial-sqrt a n)
	(if (and (not (= a 1)) (not (= a (- n 1))))
		(if (= (remainder (square a) n) 1)
			0
			(remainder (square a) n))
		(remainder (square a) n)))
|#

; use let 
(define (non-trivial-sqrt a n)
	(let ((res (remainder (square a) n)))
		(if (and (not (= a 1)) (not (= a (- n 1))))
		   (if (= res 1)
			 0
			 res)
	        res)))

(define (fast-prime? n times)
	(cond ((= times 0) true)
		  ((miller-rabin-test n) (fast-prime? n (- times 1)))
		  (else false)))


(fast-prime? 561 6)

(fast-prime? 3 3)

(fast-prime? 4 4)

(fast-prime? 7 3)