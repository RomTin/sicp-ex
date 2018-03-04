#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(define w1 (make-vect 0.00 0.83))
(define w2 (make-vect 0.20 0.70))
(define w3 (make-vect 0.35 0.80))
(define w4 (make-vect 0.45 0.80))
(define w5 (make-vect 0.38 0.88))
(define w6 (make-vect 0.40 1.00))
(define w7 (make-vect 0.60 1.00))
(define w8 (make-vect 0.62 0.88))
(define w9 (make-vect 0.58 0.80))
(define w10 (make-vect 0.75 0.80))
(define w11 (make-vect 1.00 0.48))
(define w12 (make-vect 1.00 0.45))
(define w13 (make-vect 0.70 0.68))
(define w14 (make-vect 0.82 0.00))
(define w15 (make-vect 0.72 0.00))
(define w16 (make-vect 0.57 0.30))
(define w17 (make-vect 0.40 0.00))
(define w18 (make-vect 0.28 0.00))
(define w19 (make-vect 0.42 0.42))
(define w20 (make-vect 0.35 0.70))
(define w21 (make-vect 0.22 0.58))
(define w22 (make-vect 0.00 0.78))
(define wave 
  (segments->painter 
    (list (make-segment w1 w2)
          (make-segment w2 w3)
          (make-segment w3 w4)
          (make-segment w4 w5)
          (make-segment w5 w6)
          (make-segment w7 w8)
          (make-segment w8 w9)
          (make-segment w9 w10)
          (make-segment w10 w11)
          (make-segment w12 w13)
          (make-segment w13 w14)
          (make-segment w15 w16)
          (make-segment w16 w17)
          (make-segment w18 w19)
          (make-segment w19 w20)
          (make-segment w20 w21)
          (make-segment w21 w22)
          (make-segment (make-vect 0.42 0.92) (make-vect 0.44 0.92))
          (make-segment (make-vect 0.50 0.92) (make-vect 0.52 0.92))
          (make-segment (make-vect 0.46 0.87) (make-vect 0.50 0.87))
          (make-segment (make-vect 0.46 0.87) (make-vect 0.49 0.83))
          (make-segment (make-vect 0.50 0.87) (make-vect 0.49 0.83))
          )))

(define wave2 (beside wave (flip-vert wave )))
(define wave4 (below wave2 wave2 ))

(define (flipped-pairs painter)
  (let (( painter2 (beside painter (flip-vert painter ))))
    (below painter2 painter2 )))

(define (split b1 b2)
  (lambda (painter n)
    (if (= n 0)
      painter
      (let (( smaller ((split b1 b2) painter (- n 1))))
        (b1 painter (b2 smaller smaller))))))


(define (right-split painter n)
  (if (= n 0)
    painter
    (let (( smaller (right-split painter (- n 1))))
      (beside painter (below smaller smaller )))))

(define (up-split painter n)
  (if (= n 0)
    painter
    (let (( smaller (up-split painter (- n 1))))
      (below painter (beside smaller smaller )))))

(define right-split2 (split beside below))
(define up-split2 (split below beside))


(define (corner-split painter n)
  (if (= n 0)
    painter
    (let ((up (up-split painter (- n 1)))
          (right (right-split painter (- n 1))))
      (let (( top-left (beside up up))
            (bottom-right (below right right ))
            (corner (corner-split painter (- n 1))))
        (beside (below painter top-left)
                (below bottom-right corner ))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter )))
          (bottom (beside (bl painter) (br painter ))))
      (below bottom top ))))

(define (square-limit painter n)
  (let (( combine4 (square-of-four flip-vert rotate180
                                   identity flip-horiz)))
    (combine4 (corner-split painter n))))

(paint-hires (square-limit einstein 4))

