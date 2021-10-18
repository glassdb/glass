enumerating
weeks


	| weeks |

	weeks _ OrderedCollection new.
	self weeksDo: [ :m | weeks add: m ].

	^ weeks asArray.