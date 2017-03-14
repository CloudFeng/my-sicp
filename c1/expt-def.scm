;求幂

; recursive
(define (expt-rec b n)
  (if (= n 0) 
  		1
  		(* b (expt-rec b (- n 1)))))

; test
(expt-rec 2 3)

;iterator
(define (expt b n)
	(expt-iter b n 1))

(define (expt-iter b counter product)
	(if (= counter 0)
			product
			(expt-iter b (- counter 1) (* b product))))

;test
(expt 2 3)