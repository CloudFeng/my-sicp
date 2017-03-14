(define (product term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (* (term a) result))))
	(iter a 1))

(define (product-rec term a next b)
	(if (> a b)
		1
		(* (term a) (product-rec term (next a) next b))))

(define (indentity x) x)

(define (inc x) (+ x 1))

(define (factorial n)
	(if (< n 0)
		0
		(product indentity 1 inc n)))

; test 5!
(factorial 5)


(define (pi a b)
	(define (pi-iterm x)
		(if (even? x)
			(/ (+ x 2) (+ x 1))
			(/ (+ x 1) (+ x 2))))
	(define (pi-next x) (+ x 1))
	(* 4.0 (product-rec pi-iterm a pi-next b)))

(pi 1 100)