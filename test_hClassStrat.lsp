(load "~/lisp/testing.lsp")

(load "hw3.lsp")
(load "HCLASSSTRAT.lsp")


(defvar positions (scan-rows p22 0))

(run-tests "everything" (list
  '(first positions)
  '(second positions)
  '(third positions)
  '(hClassStrat p22)
))
