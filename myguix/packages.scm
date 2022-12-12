(define-module (myguix packages)
  #:use-module (guix diagnostics)
  #:use-module (guix i18n)
  #:use-module (srfi srfi-1)
  #:export (search-patch
	    search-patches
	    %patch-path))

(define (search-patch file-name)
  (or (search-path (%patch-path) file-name)
      (raise (formatted-message (G_ "~a: patch not found")
				file-name))))

(define-syntax-rule (search-patches file-name ...)
  (list (search-patch file-name) ...))

(define %channel-root
  (find (lambda (path)
	  (file-exists? (string-append path "/myguix/packages.scm")))
	%load-path))

(define %patch-path
  (make-parameter
    (list (string-append %channel-root "/myguix/packages/patches"))))
