*squeak-instance creation
with: aValue with: val2 with: val3 with: val4 with: val5 with: val6

"(R) Returns an instance of the receiver containing the arguments."

"Reimplemented to take advantage of the new: optimization "

| inst |

inst := self new: 6.
inst at: 1 put: aValue;
     at:2 put: val2;
     at:3 put: val3;
     at:4 put: val4;
     at:5 put: val5;
     at:6 put: val6.

^inst