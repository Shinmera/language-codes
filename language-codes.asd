(asdf:defsystem language-codes
  :version "1.0.0"
  :license "zlib"
  :author "Yukari Hafner <shinmera@tymoon.eu>"
  :maintainer "Yukari Hafner <shinmera@tymoon.eu>"
  :description "A small library mapping language codes to language names."
  :homepage "https://github.com/Shinmera/language-codes"
  :serial T
  :components ((:static-file "data/iso-639-1.lisp")
               (:static-file "data/iso-639-3.lisp")
               (:file "package")
               (:file "languages")
               (:file "documentation"))
  :depends-on (:documentation-utils))
