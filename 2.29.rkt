(use gauche.test)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (total-weight mobile)
  (if (not (pair? mobile))
    mobile
    (+
      (total-weight (cadr (left-branch mobile))) 
      (total-weight (cadr (right-branch mobile))))))

(test* "" 7 (total-weight
              (make-mobile
                (make-branch 2 (make-mobile
                                 (make-branch 1 2)
                                 (make-branch 1 2)))
                (make-branch 3 3))))

(define (get-torque branch)
  (* (total-weight (cadr branch))
     (car branch)))

(define (balanced? mobile)
  (= (* (get-torque (left-branch mobile)))
     (* (get-torque (right-branch mobile)))))

(test* "" #t (balanced? (make-mobile (make-branch 3 4) (make-branch 4 3)) ))



;(define (make-mobile left right) (cons left right ))
;(define (make-branch length structure)
;   (cons length structure ))
;-> right-branch: cadr -> cdr
