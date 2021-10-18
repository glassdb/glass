*squeak
julianDayNumber: aJulianDayNumber

  ^self epoch + (Duration days: aJulianDayNumber - 2415386 "julian calendar base")