(define (over-or-under num1 num2)
  (cond
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    ((> num1 num2) 1)))

(define (composed f g)
  (lambda (x) (f (g x))))

(define (repeat f n)
  (if (= n 0)
    (lambda (x) x)
    (composed f (repeat f (- n 1)))))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (max-modulo a b)
  (modulo (max a b) (min a b)))

(define (gcd a b)
  (if (= (max-modulo a b) 0)
    (min a b)
    (gcd (min a b) (max-modulo a b))))

(define (exp b n)
  (define (helper n so-far)
    (if (= n 0)
      so-far
      (helper (- n 1) (* b so-far))))
  (helper n 1))


(define (swap s)
  (define (helper s so-far-reversed)
    (cond
      ((null? s) so-far-reversed)
      ((null? (cdr s)) (cons (car s) so-far-reversed))
      (else (helper
        (cdr (cdr s))
        (cons (car s) (cons (car (cdr s)) so-far-reversed))))
    )
  )

  (define (reverse s so-far)
    (if (null? s)
      so-far
      (reverse (cdr s) (cons (car s) so-far))
    )
  )

  (reverse (helper s nil) nil)
)

(define (make-adder num)
  (lambda (inc) (+ num inc)))
