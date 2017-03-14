(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divisors? n test-divisor) test-divisor)
		  (else (find-divisor n (+ test-divisor 1)))))

(define (divisors? a b)
	(= (remainder a b) 0))

(define (square x) (* x x))


(define (prime? n)
	(= n (smallest-divisor n)))

(define (timed-prime-test n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime n (- (runtime) start-time))
		#f))

(define (report-prime n elapsed-time)
	(newline)
	(display n)
	(display " *** ")
	(display elapsed-time))

 (define (search-for-primes first last) 
   (define (search-iter cur last) 
     (if (<= cur last) 
     	(begin (timed-prime-test cur) 
     		   (search-iter (+ cur 2) last)))) 
   (search-iter (get-left first) 
                (get-right last))) 

(define (get-left left)
	(if (even? left)
		(+ left 1)
		left))

(define (get-right right)
	(if (even? right)
		(- right 1)
		right))


 (search-for-primes 1000 1019)       
 (search-for-primes 10000 10037)      
 (search-for-primes 100000 100043)    
 (search-for-primes 1000000 1000037)

