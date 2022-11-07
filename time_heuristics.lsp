(load "hw3.lsp")
(load "a-star.lsp")

(defvar heuristics (list
  'hDummy
  'hShortestStarManhat
))

(loop for h in heuristics do
  (format t "~%~%Timing ~a...~%~%" h)
  (load (format nil "~a.lsp" h))
  (time (sokoban p16 (symbol-function h))))
