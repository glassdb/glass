running
setUp
  "run tests using ExtendedNumberParser class"

  "https://github.com/GsDevKit/GsDevKit/issues/75"

  theDefaultParserNumberClass := NumberParser defaultParserClass.
  NumberParser defaultParserClass: ExtendedNumberParser.
  super setUp