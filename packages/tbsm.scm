(use-modules (guix build-system gnu)
             (guix git-download)
             ((guix licenses) #:prefix license:)
             (guix packages))

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
        (base32
          "0x0jsbyjm9zq32rdzqz0qm5qhxppg5zqh80nydcizd31cvx3yv60"))))
  (build-system gnu-build-system)
  (arguments
   `(#:tests? #f
     #:make-flags (list (string-append "DESTDIR=" (assoc-ref %outputs "out")))
     #:phases (modify-phases %standard-phases
                (delete 'configure))))
  (home-page "https://github.com/loh-tar/tbsm")
  (synopsis "")
  (description "")
  (license license:gpl2))

; vim: ts=2 sw=2 sts=2 et nowrap
