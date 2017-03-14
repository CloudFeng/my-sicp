; ex1.13
(define (pascal-triangle row col)
	(cond ((or (< col 0) (< row col)) 0)
		  ((or (= col 1) (= row col)) 1)
		  (else (+ (pascal-triangle (- row 1) col)
		  		   (pascal-triangle row (- col 1))))))

;test
(pascal-triangle 1 0)
(pascal-triangle 1 -1)
(pascal-triangle 1 1)
(pascal-triangle 2 1)
(pascal-triangle 5 2)
