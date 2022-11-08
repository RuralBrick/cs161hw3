(load "hw3.lsp")
(load "manhattan-dist.lsp")


(defun scan-columns (row r c)
  (if row
    (let*
      (
        (v (car row))
        (rest-positions (scan-columns (cdr row) r (+ c 1)))
        (box-positions (first rest-positions))
        (star-positions (second rest-positions))
      )
      (cond
        ((isBox v)
          (list
            (cons (list c r) box-positions)
            star-positions))
        ((isStar v)
          (list
            box-positions
            (cons (list c r) star-positions)))
        (t rest-positions)))))

(defun scan-rows (s r)
  (if s
    (let*
      (
        (row-positions (scan-columns (car s) r 0))
        (row-box-positions (first row-positions))
        (row-star-positions (second row-positions))
        (rest-positions (scan-rows (cdr s) (+ r 1)))
        (rest-box-positions (first rest-positions))
        (rest-star-positions (second rest-positions))
      )
      (list
        (append row-box-positions rest-box-positions)
        (append row-star-positions rest-star-positions)))))

(defun get-box-and-star-positions (s)
  (scan-rows s 0))


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

(defun hMinBoxStarDistSum (s)
  (let*
    (
      (positions (get-box-and-star-positions s))
      (box-positions (first positions))
      (star-positions (second positions))
    )
    (if (or (null box-positions) (null star-positions))
      0
      (sum-reduce
        (min-boxes-to-stars-distances box-positions star-positions)
        0))))
