;ex1-37
(define (cont-frac n d k)
	(define (cont-frac-iter i result)
		(if (= i 0)
			result
			(cont-frac-iter (- i 1) 
							(/ (n i) 
							   (+ (d i) result)))))

	(define (cont-frac-rec i result)
		(if (= i 0)
			result
			(/ (n i)
			   (+ (d i) (cont-frac-iter (- i 1) result)))))
	(cont-frac-rec k 0))

;test
(cont-frac (lambda (i) 1.0)
		   (lambda (i) 1.0)
		   10)