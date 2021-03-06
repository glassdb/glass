test select
testSelectLessThanQuery
	"select: {:ea | ea.key < 50} "
	
	| nsc result queryBlock |
	nsc := nscs first.
	queryBlock := [
		result := nsc select: #(key) comparing: #< with: queryValue key.
		self assert: result size = 49.
		result do: [:assoc | self assert: (assoc key < queryValue key) ].
		self deny: (result includes: queryValue) ].
	
	queryBlock value.
	nsc createRcEqualityIndexOn: 'key' withLastElementClass: Number.
	queryBlock value.
