(define (multi a b)
	(if (= b 0)
		0
		(+ a (multi a (- b 1)))))

(multi 2 3)


(define (double x) (+ x x))

(define (halve x) (/ x 2.0))


(define (fast-multi a b)
	(cond ((= b 0) 0)
		  ((even? b) (double (fast-multi a (halve b))))
		  (else (+ a (fast-multi a (- b 1))))))

(fast-multi 2 2)

(fast-multi 2 3)
