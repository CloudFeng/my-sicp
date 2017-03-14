(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a) (sum term (next a) next b))))

;pi-sum, using lambda
(define (pi-sum a b)
	(sum (lambda (x) (/ 1.0 (* x (+ x 2))))
		a
		(lambda (x) (+ x 4))
		b))

;test
(* (pi-sum 1 1000) 8)


;integral
(define (integral f a b dx)
	(* (sum f (+ a (/ dx 2.0)) (lambda (x) (+ x dx)) b)
	   dx))


;test
(integral (lambda (x) (* x x x)) 0 1 0.001)


((lambda (x y z) (+ x y (square z))) 1 2 3)