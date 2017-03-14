(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a) (sum term (next a) next b))))

(define (simpson f a b n)
	(define (fixed-x x)
		(+ x (remainder x 2)))

	(define h (/ (- b a) (fixed-x n)))

	(define (simpson-factor k)
		(cond ((or (= k 0) (= k (fixed-x n))) 1)
			  ((even? k) 2)
			  (else 4)))

	(define (simpson-term k)
		(* (simpson-factor k) (+ a (* k h))))
	(* (/ h 3.0) (sum simpson-term 0 inc n)))

;test n = 100, a = 0, b = 1
(simpson cube 0 1 100)


; n = 1000, a = 0, b = 1
(simpson cube 0 1 1000)