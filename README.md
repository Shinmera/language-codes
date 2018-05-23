## About Language-Codes
This is a small library providing the ISO-639 language code to language name mapping.

## How To
After loading the library, simply use `names` to retrieve the list of known names for a language code.
    
    (language-codes:names :eng)      ; => ("English")
    (language-codes:names :ht)       ; => ("Haitian" "Haitian Creole")

You can also perform the inverse lookup, by `codes`.

    (language-codes:codes "english") ; => (:ENG :EN)
