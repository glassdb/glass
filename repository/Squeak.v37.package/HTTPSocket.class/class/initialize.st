initialization
initialize
	"HTTPSocket initialize"

	CR := Character cr.
	LF := Character lf.

	"string for command line termination:"
	CrLf := String with: CR with: LF.

	HTTPProxyCredentials := HTTPBlabEmail := ''.  "	'From: somebody@no.where', CrLf	"