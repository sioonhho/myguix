(define-module (packages rust-chvt)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  ;#:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-io))

(define-public rust-chvt-0.2
  (name "rust-chvt")
  (version "0.2.0")
  (source
    (origin
      (method url-fetch)
      (uri (crate-uri "chvt" version))
      (file-name (string-append name "-" version ".tar.gz"))
      (sha256
        (base32 ""))))
  (build-system cargo-build-system))

; vim: sts=2 sw=2 ts=2 et nowrap
