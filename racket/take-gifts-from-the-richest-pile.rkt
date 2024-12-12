#lang racket

(require data/heap)

(define/contract (pick-gifts gifts k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
    (define heap (make-heap >=))
    (heap-add-all! heap gifts)
    (for ([_i (in-range k)])
      (heap-add!
        heap
        (truncate
          (sqrt
            (let ([min-item (heap-min heap)])
                 (begin
                    (heap-remove-min! heap)
                    min-item))))))
    (inexact->exact (sequence-fold (lambda (acc x) (+ acc (truncate x))) 0 (in-heap/consume! heap))))
