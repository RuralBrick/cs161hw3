(defun manhattan-dist (pos1 pos2)
  (let
    (
      (x1 (first pos1))
      (y1 (second pos1))
      (x2 (first pos2))
      (y2 (second pos2))
    )
    (+ (abs (- x1 x2)) (abs (- y1 y2)))))
