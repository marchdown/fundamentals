(TeX-add-style-hook
 "02functions"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8x")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "pf2"
    "amssymb"
    "ucs"
    "inputenc")))

