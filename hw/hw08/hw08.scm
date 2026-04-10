(define (ascending? s)
    (if (null? s)
        #t
        (begin
        (define (helper l)
            (cond
                ((null? (cdr l)) #t)
                ((> (car l) (car (cdr l))) #f)
                (else (helper (cdr l)))))
        (helper s))))

(define (my-filter pred s)
    (cond
        ((null? s) s)
        ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
        (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2)
    (cond
        ((null? lst1) lst2)
        ((null? lst2) lst1)
        (else (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2)))))))

(define (no-repeats s)
    (if (null? s)
        s
        (cons (car s) (no-repeats (filter (lambda (val) (not (= val (car s)))) s)))
    )
)
