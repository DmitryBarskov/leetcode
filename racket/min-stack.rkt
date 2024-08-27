(require racket/class)

(define min-stack%
  (class object%
    (super-new)
    (init-field [stack '()]
                [min-stack '()])

    ; push : exact-integer? -> void?
    (define/public (push val)
      (set! stack (cons val stack))
      (set! min-stack
            (cons
              (min val
                   (if (null? min-stack)
                       val
                       (car min-stack)))
              min-stack)))

    ; pop : -> void?
    (define/public (pop)
      (set! stack (cdr stack))
      (set! min-stack (cdr min-stack)))
    ; top : -> exact-integer?
    (define/public (top)
      (car stack))
    ; get-min : -> exact-integer?
    (define/public (get-min)
      (car min-stack))))
