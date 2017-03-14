
(define (square x) (* x x))

; base^exp % m
(define (expmod base ex m)
	(cond ((= ex 0) 1)
		  ((even? ex) (remainder (square (expmod base (/ ex 2) m)) m))
		  (else (remainder (* base (expmod base (- ex 1) m)) m))))


;fermat-test:a^n % n = a % n = a
(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))



(define (fast-prime? n times)
	(cond ((= times 0) true)
		  ((fermat-test n) (fast-prime? n (- times 1)))
		  (else false)))


(define (timed-prime-test n times)
	(newline)
	(display n)
	(start-prime-test n times (runtime)))

(define (start-prime-test n times start-time)
	(if (fast-prime? n times)
		(report-prime (- (runtime) start-time))
		#f))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (search-for-prime first last times)
	(define (search-iter cur last)
		(if (<= cur last)
			(begin (timed-prime-test cur times)
				    (search-iter (+ 2 cur) last))))
	(search-iter (if (even? first) (+ first 1) first)
				 (if (even? last) (- last 1) last)))

(search-for-prime 100000000 100000037 10)
