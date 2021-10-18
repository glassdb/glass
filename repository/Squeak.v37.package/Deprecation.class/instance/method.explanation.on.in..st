initialize-release
method: aCompiledMethod explanation: anExplanationString on: dateString in: aVersionString
	methodReference := MethodReference class: aCompiledMethod inClass selector: aCompiledMethod selector.
	explanationString := anExplanationString.
	deprecationDate := dateString.
	versionString := aVersionString