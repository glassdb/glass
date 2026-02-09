*gssqueakcommon-core
waitTimeoutSeconds: anInteger
	"Wait on this semaphore for up to the given number of seconds, then timeout.
	Return true if the deadline expired, false otherwise."

	^(self waitForSeconds: anInteger) not
