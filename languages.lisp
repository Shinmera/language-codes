#|
 This file is a part of language-codes
 (c) 2018 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.language-codes)

(defvar *here* (make-pathname :name NIL :type NIL :defaults
                              #.(or *compile-file-pathname* *load-pathname*
                                    (error "Compile or load this file please."))))

(defvar *language-code-map* (make-hash-table :test 'eq))
(defvar *language-name-map* (make-hash-table :test 'equalp))

(defgeneric names (code))
(defgeneric (setf names) (names code))

(defmethod names ((code string))
  (let ((name (find-symbol (string-upcase code) "KEYWORD")))
    (when name
      (names name))))

(defmethod names ((code symbol))
  (gethash code *language-code-map*))

(defmethod (setf names) (names (code symbol))
  (dolist (name names)
    (pushnew code (gethash name *language-name-map*)))
  (setf (gethash code *language-code-map*) names))

(defmethod (setf names) ((null null) (code symbol))
  (remhash code *language-code-map*)
  NIL)

(defmethod (setf names) (names (code string))
  (setf (names (intern (string-upcase code) "KEYWORD")) names))

(defgeneric codes (language))

(defmethod codes ((language string))
  (gethash language *language-name-map*))

(defun load-code-map (file)
  (with-open-file (stream file :external-format :utf-8)
    (loop for line = (read stream NIL :eof)
          until (eql line :eof)
          do (destructuring-bind (code &rest names) line
               (setf (names code) names)))
    *language-code-map*))

(load-code-map (merge-pathnames "data/iso-639-1.lisp" *here*))
(load-code-map (merge-pathnames "data/iso-639-3.lisp" *here*))
