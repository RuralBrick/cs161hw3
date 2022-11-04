(load "~/lisp/testing")

(load "hw3.lsp")


(defvar solved_p '(
  (1 1 1 1 1)
  (1 0 0 0 1)
  (1 0 0 0 1)
  (1 0 3 5 1)
  (1 1 1 1 1)))


; (run-tests "goal-test" (list
;   '(goal-test solved_p)
;   '(null (goal-test p1))
; ))


(run-tests "get-square" (list
  '(= 0 (get-square p10 0 5))
  '(= 4 (get-square p1 5 4))
))

(run-tests "set-square" (list
  
))

(run-tests "try-move" (list
  
))

(run-tests "next-states" (list
  
))


; (run-tests "h0" (list
;   '(= (h0 '()) 0)
; ))

; (run-tests "h1" (list
;   '(= (h1 solved_p) 0)
;   '(= (h1 p1) 1)
;   '(= (h1 p5) 2)
;   '(= (h1 p8) 3)
;   '(= (h1 p11) 4)
; ))

(run-tests "h405462550" (list
  
))
