(define (accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) 
		(accumulate combiner null-value term (next a) next b))))


(define (accumulate-iter combiner null-value term a next b)
	(define (iter combiner a result)
		(if (> a b)
			result
			(iter combiner (next a) (combiner (term a) result))))
	(iter combiner a null-value))


(define (sum term a next b)
	(define (add x y) (+ x y))
	(accumulate add 0 term a next b))


(define (product term a next b)
	(define (multiply x y) (* x y))
	(accumulate multiply 1 term a next b))

(define (identity x) x)
(define (inc x) (+ x 1))

;test
(define (sum-integers a b)
	(sum identity a inc b))

(sum-integers 1 5)

(define (product-integers a b)
	(product identity a inc b))

(product-integers 1 5)