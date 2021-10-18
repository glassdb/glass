*squeak
dayOfWeekGmt

"Returns a SmallInteger that gives the numeric index of the day of the week
 described by the receiver, expressed in Greenwich Mean Time.  The index is a
 number between 1 and 7 inclusive, where 1 signifies Sunday."

    ^(self asUTC) dayOfWeek