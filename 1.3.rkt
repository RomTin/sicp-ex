(define	(desc2 a b c)
        (cond
          ((and (> a b) (> a c)) (+ (* a a) (* b b)))
          ((and (> a b) (> c b)) (+ (* a a) (* c c)))
          ((and (> b a) (> c a)) (+ (* b b) (* c c)))
          )
        )

(display (desc2 3 4 5))
