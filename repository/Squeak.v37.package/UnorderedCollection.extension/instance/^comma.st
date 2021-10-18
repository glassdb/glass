*squeak
, aCollection

| newCollection |
newCollection := self copy.
newCollection addAll: aCollection.
^ newCollection