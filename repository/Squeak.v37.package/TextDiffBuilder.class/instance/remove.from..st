private
remove: pointKey from: aSet

	self hasMultipleMatches ifFalse:[^aSet remove: pointKey].
	aSet removeAllXAndY: pointKey.