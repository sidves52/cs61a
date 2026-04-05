(define (square n) (* n n))

(define (pow base exp)
  (cond
    ((= exp 1) base)
    ((odd? exp) (* base (pow base (- exp 1))))
    ((even? exp) (pow (square base) (/ exp 2)))))

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (begin
          (define y (* x (square x)))
          (repeatedly-cube (- n 1) y)
        )))

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))
