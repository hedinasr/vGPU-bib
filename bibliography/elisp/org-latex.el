;; org-latex.el --- Emacs configuration for org-mode Latex export with IEEEtran
;; theme.

;; INSTALL PACKAGES
;; -------------------------------------
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

 (defvar myPackages
   '(
     org-ref
     ))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; ORG MODE
;; --------------------------------------
(require 'org-ref)

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("IEEEtran"
               "\\documentclass{IEEEtran}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa

(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))
