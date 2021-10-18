private
textForNewMethod
	"Return the text for the template of a new method."

	^('message selector and argument names\',
		'	"comment stating purpose of message"\',
		'\',
		'    | temporary variable names |\',
		'    statements\') withCRs