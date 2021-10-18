*squeak
deprecated: anExplanationString
	"Warn that the sending method has been deprecated."

	false ifTrue: [ Transcript cr; show: 'Deprecated protocol: ' , anExplanationString ].