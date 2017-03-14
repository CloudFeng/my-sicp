;find the zero point
(define (search f neg-point pos-point)
	(let ((mid-point ((lambda (x y) (/ (+ x y) 2)) neg-point pos-point)))
		(if (close-enough? neg-point pos-point)
			mid-point
			(let ((test-value (f mid-point)))
				(cond ((positive? test-value) (search f neg-point mid-point))
					  ((negative? test-value) (search f mid-point pos-point))
					  (else mid-point))))))


(define (close-enough? x y)
	(< (abs (- x y)) 0.001))


(define (half-interal-method f a b)
	(let ((a-value (f a))
		  (b-value (f b)))
		 (cond ((and (negative? a-value) (positive? b-value))
		 		(search f a b))
			   ((and (positive? a-value) (negative? b-value))
			    (search f b a))
			   (else (error "Value are not of opposite sign:" a b)))))

(half-interal-method sin 2.0 4.0)

;x^3-2x-3=0
(half-interal-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)