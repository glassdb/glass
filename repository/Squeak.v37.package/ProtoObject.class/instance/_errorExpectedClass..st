class membership
_errorExpectedClass: aClass

"Sends an error message indicating that receiver was not a kind of aClass"

^ self _error: #rtErrBadArgKind args: { aClass }