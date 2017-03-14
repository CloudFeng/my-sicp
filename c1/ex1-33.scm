(define (filtered-accumulate filter combiner null-value term a next b)
	(if (> a b)
		null-value
		(if (filter a)
			(combiner (term a) 
					(filtered-accumulate filter combiner null-value term (next a) next b))
			(combiner null-value 
				(filtered-accumulate filter combiner null-value term (next a) next b)))))


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

(define (identity x) x)

(define (inc x) (+ x 1))

;a)
(define (sum-prime a b)
	(filtered-accumulate prime? + 0 identity a inc b))

;1 + 2 + 3 + 5 + 7
(sum-prime 1 10)

;b)
(define (gcd a b)
	(define (gcd-help a b)
		(if (= b 0)
			a
			(gcd-help b (remainder a b))))
	(if (> a b)
		(gcd-help a b)
		(gcd-help b a)))


(define (relative-prime-product n)	
	(define (relative-prime? x)
		(if (> x n)
			false
			(= (gcd x n) 1)))
	(filtered-accumulate relative-prime? * 1 identity 1 inc n))

(relative-prime-product 10)
