(define (cube x) * x x x)

(define (p x)
	(- (* 3 x)
	   (* 4 (cube x))))

(define (sine angle)
	(if (not (> (abs angle) 0.1))
	    angle
	    (p (sine (/ angle 3)))))


; 在求值(sine 12.15)时，p将被使用多少次? 5次
(sine 12.15)

;在求值(sine a)时，由过程sine所产生的计算过程使用的空间和步骤增长的阶是什么? 空间为O(1), 步骤:O(log3(n))