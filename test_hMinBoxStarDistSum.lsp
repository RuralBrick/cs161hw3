(load "~/lisp/testing.lsp")

(load "hw3.lsp")
(load "HMINBOXSTARDISTSUM.lsp")


(defvar p17positions (get-box-and-star-positions p17))
(defvar p17box-positions (first p17positions))
(defvar p17star-positions (second p17positions))

(run-tests "everything" (list
  '(hMinBoxStarDistSum p17)
))
