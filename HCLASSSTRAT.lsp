(load "hw3.lsp")
(load "manhattan-dist.lsp")


(defun scan-squares (row r c)
  (if row
    (let ((v (car row)) (rest-positions (scan-squares (cdr row) r (+ c 1))))
      (cond
        ((isBox v)
          (list
            (cons (list c r) (first rest-positions))
            (second rest-positions)))
        ((isStar v)
          (list
            (first rest-positions)
            (cons (list c r) (second rest-positions))))
        (t rest-positions)))))

(defun scan-rows (s r)
  (if s
    (let
      (
        (row-positions (scan-squares (car s) r 0))
        (rest-positions (scan-rows (cdr s) (+ r 1)))
      )
      (list
        (append (first row-positions) (first rest-positions))
        (append (second row-positions) (second rest-positions))))))


(defun min-box-to-stars-dist (bpos spositions current-min)
  (if (null spositions)
    current-min
    (min-box-to-stars-dist
      bpos
      (cdr spositions)
      (min (manhattan-dist bpos (car spositions)) current-min))))

(defun min-box-star-dist-sum (bpositions spositions sum)
  (if (null bpositions)
    sum
    (let ((bpos (car bpositions)))
      (min-box-star-dist-sum
        (cdr bpositions)
        spositions
        (+
          (min-box-to-stars-dist
            bpos
            (cdr spositions)
            (manhattan-dist bpos (car spositions)))
          sum)))))


(defun hClassStrat (s)
  (let*
    (
      (positions (scan-rows s 0))
      (bpositions (first positions))
      (spositions (second positions))
    )
    (if (or (null bpositions) (null spositions))
      0
      (min-box-star-dist-sum bpositions spositions 0))))
