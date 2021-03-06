test range select
testRangeSelectGreaterThanLessThan
	"select: {:ea | (ea.key > 25) & (ea.key < 50) } "
	
	| nsc result queryBlock |
	nsc := nscs first.
	queryBlock := [
		result := nsc low: 25 comparing: #< select: #(key) comparing: #< high: 50. 
		self assert: result size = 24.
		result do: [:assoc | self assert: (assoc key > 25) & (assoc key < 50) ].
		self deny: (result includes: queryValue) ].
	
	queryBlock value.
	nsc createRcEqualityIndexOn: 'key' withLastElementClass: Number.
	queryBlock value.
