(define (fixed-point f first-guess)
  (define count 0)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (set! count (+ count 1))
    (let ([next (f guess)])
      #?=next
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess)
  count)
