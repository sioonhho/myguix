(define-module (myguix packages)
  #:use-module (gnu packages)
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
    (string-append %channel-root "/myguix/packages/patches")))
