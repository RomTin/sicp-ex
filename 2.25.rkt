(use gauche.test)
(test* "" 7 (cadadr (cdr '(1 3 (5 7) 9) )) )
(test* "" 7 (caar '((7)) ) )
(test* "" 7 (cadadr (cadadr (cadadr '(1 (2 (3 (4 (5 (6 7)))))) ))) )
