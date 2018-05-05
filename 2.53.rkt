(use gauche.test)

(test* "" '(a b c) (list 'a 'b 'c))
(test* "" '((george)) (list (list 'george)) )
(test* "" '((y1 y2)) (cdr '((x1 x2) (y1 y2))) )
(test* "" '(y1 y2) (cadr '((x1 x2) (y1 y2))))
(test* "" #f (pair? (car '(a short list))))
(test* "" #f (memq 'red '((red shoes) (blue socks))))
(test* "" '(red shoes blue socks) (memq 'red '(red shoes blue socks)))

#|
test , expects (a b c) ==> ok
test , expects ((george)) ==> ok
test , expects ((y1 y2)) ==> ok
test , expects (y1 y2) ==> ok
test , expects #f ==> ok
test , expects #f ==> ok
test , expects (red shoes blue socks) ==> ok
|#
