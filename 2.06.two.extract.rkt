(add-1 one)
->
(lambda (f)
  (lambda (x)
    (f (((lambda (f) (lambda (x) f x)) f) x))))
