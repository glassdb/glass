enumerating
collect: aBlock

"Evaluates aBlock with each of the receiver's values as the argument and
 collects the resulting values into the appropriate Dictionary at the
 corresponding key values."

| result |

result := self speciesForCollect new: (self size).
self keysAndValuesDo: [ :aKey :aCollection |
  (aBlock value: aCollection) do: [:ea | self at: aKey put: ea ].
  ].

^ result.