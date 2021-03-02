(let ((n (parse-integer (cadr sb-ext:*posix-argv*))))
  (dotimes (i n)
    (format t "~,6f~%" (random 1.0))))


