(load "hw3.lsp")
(load "manhattan-dist.lsp")


(defun try-get-box-or-star (v r c)
  (cond
    ((isBox v) (list 'box c r))
    ((isStar v) (list 'star c r))))

(defun scan-squares (row r c)
  (if row
    (cons
      (try-get-box-or-star (car row) r c)
      (scan-squares (cdr row) r (+ c 1)))))

(defun scan-rows (s r)
  (if s
    (append
      (scan-squares (car s) r 0)
      (scan-rows (cdr s) (+ r 1)))))

(defun get-positions (s)
  (cleanUpList (scan-rows s 0)))


(defun get-box-positions (positions)
  (if positions
    (let ((label (first (car positions))) (pos (rest (car positions))))
      (if (equal label 'box)
        (cons pos (get-box-positions (cdr positions)))
        (get-box-positions (cdr positions))))))

(defun get-star-positions (positions)
  (if positions
    (let ((label (first (car positions))) (pos (rest (car positions))))
      (if (equal label 'star)
        (cons pos (get-star-positions (cdr positions)))
        (get-star-positions (cdr positions))))))


(defun box-to-stars-distances (bpos spositions)
  (if spositions
    (cons
      (manhattan-dist bpos (car spositions))
      (box-to-stars-distances bpos (cdr spositions)))))


(defun min-reduce (l current-min)
  (if (null l)
    current-min
    (min-reduce (cdr l) (min (car l) current-min))))

(defun min-box-to-stars-dist (bpos spositions)
  (let ((distances (box-to-stars-distances bpos spositions)))
    (min-reduce (cdr distances) (car distances))))

(defun min-boxes-to-stars-distances (bpositions spositions)
  (if bpositions
    (cons
      (min-box-to-stars-dist (car bpositions) spositions)
      (min-boxes-to-stars-distances (cdr bpositions) spositions))))


(defun sum-reduce (l sum)
  (if (null l)
    sum
    (sum-reduce (cdr l) (+ sum (car l)))))

(defun hClassStrat (s)
  (let*
    (
      (positions (get-positions s))
      (bpositions (get-box-positions positions))
      (spositions (get-star-positions positions))
    )
    (if (or (null bpositions) (null spositions))
      0
      (sum-reduce (min-boxes-to-stars-distances bpositions spositions) 0))))
