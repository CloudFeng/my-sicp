; ex1.11
; recurison-method

(define (f-rec n)
	(if (< n 3)
			n
			(+ (f-rec (- n 1))
			   ( * (f-rec (- n 2)) 2)
			   ( * (f-rec (- n 3)) 3))))

;test
(f-rec -1)
(f-rec 2)
(f-rec 3)
(f-rec 4)

;iterator
(define (f n)
	(if (< n 3)
		n
		(f-iter 2 1 0 n)))

(define (f-iter a b c n)
	(if (< n 3) 
			a
		  (f-iter (+ a (* 2 b) (* 3 c)) 
		  				a
		  				b
		  				(- n 1))))

;test
(f -1)
(f 2)
(f 3)
(f 4)

