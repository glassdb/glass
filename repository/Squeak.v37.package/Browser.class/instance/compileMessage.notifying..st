code pane
compileMessage: aText notifying: aController 
	"Compile the code that was accepted by the user,
	placing the compiled method into an
	appropriate message category. Return true if
	the compilation succeeded, else false."
	^ (self defineMessageFrom: aText notifying: aController) notNil