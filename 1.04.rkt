(define	(a-plus-abs-b a b)
    ((if　(> b 0) + -) a b)
)

; bが非負数であれば(+ a b), 負数であれば(- a b)
