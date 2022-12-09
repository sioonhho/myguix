(define-module (myguix packages rust-chvt)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  ;#:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-io))

(define-public rust-chvt-0.2
  (package
    (name "rust-chvt")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "chvt" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1cvjc0bxxg19r0kyvvarhjx0il3xpnzg2jv0v1vvkkkh3b337yhl"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/jonay2000/chvt-rs")
    (synopsis "changes tty programatically in rust-ish (only works as root while in an X session)

")
    (description "changes tty programatically in rust-ish (only works as root while in an X session)

")
    (license license:gpl3)))

; vim: sts=2 sw=2 ts=2 et nowrap
