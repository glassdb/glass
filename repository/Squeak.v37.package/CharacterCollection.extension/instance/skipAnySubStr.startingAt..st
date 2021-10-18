*squeak
skipAnySubStr: delimiters startingAt: start
	"Answer the index of the last character within the receiver, starting at start, that does NOT match one of the delimiters. delimiters is a Array of substrings (Characters also allowed).  If the receiver is all delimiters, answer size + 1."

  | any this ind ii mySize |
  ii := start - 1.
  mySize := self size .
  [(ii := ii + 1) <= mySize ] whileTrue:
      ["look for char that does not match"

      any := false.
      delimiters do:
          [:delim |
          delim isCharacter
            ifTrue: [(self at: ii) == delim ifTrue: [any := true]]
            ifFalse:
              ["a substring" | delimSiz |

              (delimSiz := delim size) > (mySize - ii + 1)
                ifFalse:
                  [ind := 0.
                  this := true.
                  delim do:
                      [:dd |
                      dd == (self at: ii + ind) ifFalse: [this := false].
                      ind := ind + 1].
                  this
                    ifTrue:
                      [ii := ii + delimSiz - 1.
                      any := true]]
                ifTrue: [any := false]]].
      any ifFalse: [^ ii]].
  ^ mySize + 1