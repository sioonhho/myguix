(define-module (packages rust-lemurs)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-io))

(define-public rust-lemurs-0.3
  (package
    (name "rust-lemurs")
    (version "0.3.0")
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/coastalwhite/lemurs")
            (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1vs8n6vlgvrb106ahvlm1y8fd1ffz79ksyq410dcrgjah3awjpc8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-clap", rust-clap-3)
         ("rust-tui", rust-tui-0.16)
         ("rust-unicode-width", rust-unicode-width-0.1)
         ;("rust-crossterm", rust-crossterm-0.22) ; implement
         ("rust-lazy-static", rust-lazy-static-1)
         ("rust-regex", rust-regex-1.6) ; 1.5
         ("rust-rand", rust-rand-0.8)
         ("rust-nix", rust-nix-0.23)
         ("rust-libc", rust-libc-0.2)
         ;("rust-chvt", rust-chvt-0.2) ; implement
         ;("rust-pam", rust-pam-0.7) ; implement
         ;("rust-pgs-files", rust-pgs-files-0.0.7) ; implement
         ("rust-users", rust-users-0.11)
         ("rust-log", rust-log-0.4)
         ("rust-fern", rust-fern-0.6) ; 0.5.2
         ("rust-chrono", rust-chrono-0.4)
         ("rust-toml", rust-toml-0.5)
         ("rust-serde", rust-serde-1.0)
         ("rust-hex", rust-hex-0.4))))
    (home-page "https://github.com/coastalwhite/lemurs")
    (synopsis "A TUI Display/Login Manager")
    (description "The goal of this project is to create a small, robust and yet customizable Login Manager which can serve as the front-end to your graphical GNU/Linux. Lemurs uses Linux PAM as its method of authentication.")
    (license (list license:asl2.0 license:expat))))

; vim: ts=2 sw=2 sts=2 et nowrap
