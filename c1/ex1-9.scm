(define (dec x) (- x 1))

(define (inc x) (+ x 1))

(define (add a b)
  (if (= a 0)
  		b
  		(inc (add (dec a) b))))

(add 4 5)


(define (add2 a b)
	(if (= a 0)
		b
		(add2 (dec a) (inc b))))

(add2 4 5)