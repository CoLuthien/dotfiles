;;; package --- summary:
;;; Commentary:
;;; Code:
;; (setq lsp-clients-fortls-executable "fortls")

(leaf lsp-fortran
  :straight (lsp-fortran :type git
                       :host github
                       :repo "hansec/fortran-language-server")
  :require t
  :after lsp-mode
  :setq ((
           ;; (flycheck-gfortran-include-path . `("/usr/include"))
           ;; (flycheck-gfortran-args . `("-std=f2018")
          (flycheck-gfortran-language-standard . "f2008")
          ))
  )





;;; init-fort.el ends here
