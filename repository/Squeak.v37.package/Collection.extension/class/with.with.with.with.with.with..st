*squeak-instance creation
with: aValue with: val2 with: val3 with: val4 with: val5 with: val6

"Returns an instance of the receiver containing the arguments."

| inst |
inst := self new.
inst add: aValue; add: val2; add: val3; add: val4; add: val5; add: val6.
^inst