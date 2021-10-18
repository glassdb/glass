error handling
error: messageString

"Raises an error.  This method is intended for use in raising
 application-defined or user-defined errors. Returns the receiver."

System genericSignal: #halt text: messageString.
^ self