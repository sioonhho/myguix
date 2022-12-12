(define-module (myguix packages tbsm)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public tbsm-0.7
  (package
    (name "tbsm")
    (version "0.7")
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/loh-tar/tbsm")
            (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0x0jsbyjm9zq32rdzqz0qm5qhxppg5zqh80nydcizd31cvx3yv60"))
        (patches (search-patches
                   '("tbsm-makefile-prefix.patch" "tbsm-guix-compat.patch")))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:make-flags (list (string-append "PREFIX=" %output))
       #:phases (modify-phases %standard-phases
                  (delete 'configure))))
    (home-page "https://github.com/loh-tar/tbsm")
    (synopsis "A pure bash session or applications launcher. Inspired by cdm, tdm, and krunner")
    (description "This package provides a pure bash session/application launcher.")
    (license license:gpl2)))

(define-public tbsm tbsm-0.7)

; vim: ts=2 sw=2 sts=2 et nowrap
