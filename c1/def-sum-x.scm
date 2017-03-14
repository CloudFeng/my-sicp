;x^3
(define (cube x) (* x x x))

; sum = a + ... + b
(define (sum-integers a b)
	(if (> a b)
		0
		(+ a (sum-integers (+ a 1) b))))


;sum = a^3 + ... + b^3
(define (sum-cube a b)
	(if (> a b)
		0
		(+ (cube a) (sum-cube (+ a 1) b))))


;sum = 1/ (1*5) + 1/(3*7) + 1 / (5 * 9) + ....
(define (pi-sum a b)
	(if (> a b)
		0
		(+ (/ 1.0 (* a (+ a 4)))
		   (pi-sum (+ a 2) b))))

;test, a=1, b=4
(sum-integers 1 4)
(sum-cube 1 4)
(pi-sum 1 4)

