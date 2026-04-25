(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cadar x) (car (cdr (car x))))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Utility
(define (pair a b) (cons a (cons b nil)))
(define (append s x)
  ; x includes nil statement at end
  (if (null? s)
    x
    (cons (car s) (append (cdr s) x))))


;; Problem 13
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 13
  'replace-this-line

  (define (helper s i)
    (if (null? s)
      nil
      (cons (pair i (car s)) (helper (cdr s) (+ i 1)))))
  (helper s 0)

  ; END PROBLEM 13
  )


;; Problem 14

;; Return the value for a key in a dictionary list
(define (get dict key)
  ; BEGIN PROBLEM 14
  'replace-this-line

  (if (null? dict)
    #f
    (if (equal? (car (car dict)) key)
      (car (cdr (car dict)))
      (get (cdr dict) key)))

  ; END PROBLEM 14
  )

;; Return a dictionary list with a (key value) pair
(define (set dict key val)
  ; BEGIN PROBLEM 14
  'replace-this-line

  (define (helper left right)
    (if (null? right)
      (append left (cons (pair key val) nil))
      (if (equal? (car (car right)) key)
        (append left (cons (pair key val) (cdr right)))
        (helper (append left (cons (car right) nil)) (cdr right)))))

  (helper nil dict)

  ; END PROBLEM 14
  )

;; Problem 15

;; implement solution-code
(define (solution-code problem solution)
  ; BEGIN PROBLEM 15
  'replace-this-line

  (define (helper left right)
    (cond
      ((null? right)
          left)
      ((list? (car right))
          (append left (append (cons (solution-code (car right) solution) nil) (helper nil (cdr right)))))
      ((equal? (car right) '_____)
          (append left (cons solution (helper nil (cdr right)))))
      (else
          (helper (append left (cons (car right) nil)) (cdr right)))
    )
  )

  (helper nil problem)

  ; END PROBLEM 15
  )
