rectangle functions
sideNearestTo: aPoint
	| distToLeft distToRight distToTop distToBottom closest side |
	distToLeft _ aPoint x - self left.
	distToRight _ self right - aPoint x.
	distToTop _ aPoint y - self top.
	distToBottom _ self bottom - aPoint y.
	closest _ distToLeft. side _ #left.
	distToRight < closest ifTrue: [closest _ distToRight. side _ #right].
	distToTop < closest ifTrue: [closest _ distToTop. side _ #top].
	distToBottom < closest ifTrue: [closest _ distToBottom. side _ #bottom].
	^ side
"
 | r | r _ Rectangle fromUser.
Display border: r width: 1.
[Sensor anyButtonPressed] whileFalse:
	[(r sideNearestTo: Sensor cursorPoint) , '      ' displayAt: 0@0]
"