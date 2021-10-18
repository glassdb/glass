*squeak-printing
printShowingDecimalPlaces: placesDesired
  "Print the receiver showing precisely the given number of places desired .  If the placesDesired provided is positive, a decimal point and that many digits after the decimal point will always be shown.  If the placesDesired is zero, a whole number will be shown, without a decimal point.  This method could probably be greatly optimized -- improvements welcomed."

  placesDesired <= 0 ifTrue: [^ self rounded printString].

  ^(self asScaledDecimal: placesDesired) printString

"
23 printShowingDecimalPlaces: 2
23.5698 printShowingDecimalPlaces: 2
-234.567 printShowingDecimalPlaces: 5
23.4567 printShowingDecimalPlaces: 0
"