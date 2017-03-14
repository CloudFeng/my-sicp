; sum process pattern
(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
		   (sum term (next a) next b))))



(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (sum-integers a b)
	(define (identity x) x)
	(sum identity a inc b))


(define (sum-cube a b)
	(sum cube a inc b))

(define (pi-sum a b)
	(define (pi-term x)
		(/ 1.0 (* x (+ x 2))))
	(define (pi-next x)
		(+ x 4))
	(sum pi-term a pi-next b))

(sum-integers 1 10)
(sum-cube 1 10)
(pi-sum 1 10)

(define (integral f a b dx)
	(define (integral-term x)
		(+ a (/ dx 2.0)))
	(define (integral-next x)
		(+ x dx))
	(* (sum f (integral-term a) integral-next b)
	   dx))

(integral cube 0 1 0.001)