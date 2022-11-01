(load "~/lisp/testing")

(load "hw3.lsp")


(run-tests "goal-test" (list
  '(goal-test '(
    (1 1 1 1 1)
    (1 0 0 0 1)
    (1 0 0 0 1)
    (1 0 3 5 1)
    (1 1 1 1 1)))
  '(null (goal-test p1))
))
