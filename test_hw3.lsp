(load "~/lisp/testing")

(load "hw3.lsp")


(setq solved_p '(
  (1 1 1 1 1)
  (1 0 0 0 1)
  (1 0 0 0 1)
  (1 0 3 5 1)
  (1 1 1 1 1)))


(run-tests "goal-test" (list
  '(goal-test solved_p)
  '(null (goal-test p1))
))

(run-tests "h0" (list
  '(= (h0 '()) 0)
))

(run-tests "h1" (list
  '(= (h1 solved_p) 0)
  '(= (h1 p1) 1)
  '(= (h1 p5) 2)
  '(= (h1 p8) 3)
  '(= (h1 p11) 4)
))
