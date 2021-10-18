as yet unclassified
isMultipartAlternative
	"whether the document is in a multipart format where the parts are alternates"
	^ self contentType = 'multipart/alternative'