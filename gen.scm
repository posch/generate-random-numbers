(use-modules (ice-9 format))
(define (main args)
  (let ((n (string->number (cadr args))))
    (do ((i 1 (+ i 1)))
	((> i n))
      (format #t "~,6f\n" (random 1.0)))))



