;ex1-38
(define (cont-frac n d k)
	(define (cont-frac-iter i result)
		(if (= 0 i)
			result
			(cont-frac-iter (- i 1) 
							(/ (n i)
							   (+ (d i) result)))))
	(cont-frac-iter k 0))

(define (de k)
	(+ 2
		(cont-frac (lambda (i) 1.0)
				   (lambda (i) (let ((remain (remainder i 3)))
				   				(if (= remain 2)
				   					(+ (* remain (truncate (/ i 3.0))) 2)
				   					1))) k)))

;i%3=remain=2  => remain * (i / 3) + remain = remain *(i-remain)/3+remain=remain*((i-remain)/3+1)=2*((i-2)/3+1)=2(i+1)/3

(define (de-frac-con k)
	(+ 2
		(cont-frac (lambda (i) 1.0)
					(lambda (i) 
						(if (= (remainder i 3) 2)
							(/ (+ i 1) 1.5)
							1)) k)))
(de 10)
(de-frac-con 10)