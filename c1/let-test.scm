;f(x,y)=x(1+xy)^2+y(1-y)+(1+xy)(1-y)

;1.using define to define a process
(define (def-f x y)
	(define a (+ 1 (* x y)))
	(define b (- 1 y))
	(+ (* x ((lambda (z) (* z z)) a))
	   (* y b)
	   (* a b)))

(def-f 0 0) 

;2.using lambda 
(define (lambda-f x y)
	((lambda (a b)
		(+ (* x ((lambda (z) (* z z)) a))
		   (* y b)
		   (* a b)))
	 (+ 1 (* x y))
	 (- 1 y)))

(lambda-f 0 0)

;3.using let
(define (lef-f x y)
	(let ((a (+ 1 (* x y)))
		 (b (- 1 y)))
		(+ (* x ((lambda (z) (* z z)) a))
		   (* y b)
		   (* a b))))
(lef-f 0 0)

(define x 2)

(let ((x 3)
	  (y (+ x 2)))
	(* x y))