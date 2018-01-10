(add-1 zero)
->
(lambda (f)
  (lambda (x)
    (f (((lambda (f) (lambda (x) x)) f) x))))
->
(lambda (f)
  (lambda (x)
    (f (((lambda (x) x) f) x))))
->
(lambda (f)
  (lambda (x)
    (f ((lambda (f) f) x))))
->
(lambda (f)
  (lambda (x)
    (f x)))
