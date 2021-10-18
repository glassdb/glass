*squeak
substrings
	"Answer an array of the substrings that compose the receiver."
| nextName result esc c |

result := Array new.
self size == 0 ifTrue: [
  ^result
].
nextName := self speciesForConversion new.
esc := false.
1 to: self size do:
  [ :i |
  c := self at: i.
  esc ifTrue:
    [
    nextName add: c.
    esc := false.
    ]
  ifFalse:
    [
    c == $\ ifTrue:
	[ esc := true ]
    ifFalse:
	[
	c isSqueakSeparator ifTrue:
          [
        nextName size > 0 ifTrue: [result add: nextName].
          nextName := self speciesForConversion new.
          ]
	ifFalse:
          [ nextName add: c ].
        ].
    ].
  ].

esc ifTrue:
  [ nextName add: $\ ].

(nextName size > 0 _or: [result size == 0]) ifTrue:
  [ result add: nextName ].

^result