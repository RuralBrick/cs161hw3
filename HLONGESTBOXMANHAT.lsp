;; NOTE: Fatal flaw -- once keeper reaches box, it's always the closest

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

(defun max-reduce (l current-max)
  (if (null l)
    current-max
    (max-reduce (cdr l) (max (car l) current-max))))

(defun max-dist (distances)
  (let ((reduction (max-reduce (cdr distances) (car distances))))
    (if (null reduction)
      0
      reduction)))

(defun hLongestBoxManhat (s)
  (let ((keeper-pos (getKeeperPosition s 0)))
    (max-dist (box-pos-to-dist keeper-pos (get-box-positions s)))))
