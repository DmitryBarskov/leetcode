(define/contract (similar-pairs words)
  (-> (listof string?) exact-integer?)
    (define (chars-bit-set word)
      (foldl
        (lambda (char bits)
          (bitwise-ior
            (arithmetic-shift 1 (- (char->integer char) (char->integer #\a)))
            bits))
        0
        (string->list word)))
    (foldl
      (lambda (similar-words pairs)
        (let [(n (length similar-words))]
             (+ (/ (* (- n 1) n) 2) pairs)))
      0
      (group-by chars-bit-set words))
  )
