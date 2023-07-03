(in-package #:org.shirakumo.language-codes)

(docs:define-docs
  (function names
    "Accessor to the list of English language names for the given language code.

The code can be either a string or keyword of the
two- or three-letter ISO 639 codes.

By default codes for ISO-639-1 and ISO-639-3 are
loaded in. You can use this function to define your
own code mappings if necessary.

See https://www.loc.gov/standards/iso639-2/php/English_list.php
See https://iso639-3.sil.org/
See CODES")

  (function codes
    "Returns the list of known codes for the given language.

The language is matched case-insensitively.

See NAMES")

  (function load-code-map
    "Load a code map file.

The file should be composed of s-expressions of
the following format:

FILE  ::= ENTRY*
ENTRY ::= (CODE NAME*)
CODE  --- A string of the two- or three-letter code
NAME  --- A string for a human-readable name of the
          language this code identifies.

See NAMES"))
