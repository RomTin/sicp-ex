(define (function n)
  (if (< n 3) n
    (+ 
      (+
        (function (- n 1))
        (* 2 (function (- n 2)))
        )
      (* 3 (function (- n 3)))
      )
    )
  )
