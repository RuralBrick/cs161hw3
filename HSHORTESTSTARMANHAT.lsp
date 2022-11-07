(load "hw3.lsp")
(load "manhattan-dist.lsp")

(defun scan-columns (row r c)
  (if (not (null row))
    (if (isBox (car row))
      (cons
        (list c r)
        (scan-columns (cdr row) r (+ c 1)))
      (scan-columns (cdr row) r (+ c 1)))))

(defun scan-rows (s r)
  (if (not (null s))
    (append
      (scan-columns (car s) r 0)
      (scan-rows (cdr s) (+ r 1)))))

(defun get-box-positions (s)
  (scan-rows s 0))

(defun box-pos-to-dist (kpos bpositions)
  (if (not (null bpositions))
    (cons
      (manhattan-dist kpos (car bpositions))
      (box-pos-to-dist kpos (cdr bpositions)))))

(defun min-reduce (l current-min)
  (if (null l)
    current-min
    (min-reduce (cdr l) (min (car l) current-min))))

(defun min-dist (distances)
  (let ((reduction (min-reduce (cdr distances) (car distances))))
    (if (null reduction)
      0
      reduction)))

(defun hShortestStarManhat (s)
  (let ((keeper-pos (getKeeperPosition s 0)))
    (min-dist (box-pos-to-dist keeper-pos (get-box-positions s)))))
