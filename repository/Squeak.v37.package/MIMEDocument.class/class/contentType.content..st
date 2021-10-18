instance creation
contentType: aString  content: content
	"create a MIMEObject with the given content-type and content"
	"MIMEObject contentType: 'text/plain' content: 'This is a test'"
	
	| ans idx |
	ans _ self new.
	ans privateContent: content.

	"parse the content-type"
	(aString isNil or: [
		idx _ aString indexOf: $/.
		idx = 0]) 
	ifTrue: [ 
		ans privateMainType: 'application'.  
		ans privateSubType: 'octet-stream' ]
	ifFalse: [ 
		ans privateMainType: (aString copyFrom: 1 to: idx-1).
		ans privateSubType: (aString copyFrom: idx+1 to: aString size) ].

	^ans