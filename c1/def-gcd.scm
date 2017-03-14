;gcd
(define (gcd a b)
	(if (= a (max a b))
			(gcd-helper a b)
			(gcd-helper b a)))

(define (gcd-helper a b)
	(if (= b 0)
			a
			(gcd-helper b (remainder a b))))

;test
(gcd 206 40)

(gcd 40 206)