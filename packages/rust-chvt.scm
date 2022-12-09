(define-module (packages rust-chvt)
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
            "1vs8n6vlgvrb106ahvlm1y8fd1ffz79ksyq410dcrgjah3awjpc8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-libc", rust-libc-0.2)
         ("rust-nix", rust-nix-0.15))))
    (home-page "https://github.com/jonay2000/chvt-rs")
    (synopsis "changes tty programatically in rust-ish (only works as root while in an X session)

")
    (description "changes tty programatically in rust-ish (only works as root while in an X session)

")
    (license license:gpl3)))

; vim: sts=2 sw=2 ts=2 et nowrap
