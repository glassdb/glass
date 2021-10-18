*squeak
hashBytes: aByteArray startingWith: speciesHash
	"Answer the hash of a byte-indexed collection,
	using speciesHash as the initial value.
	See SmallInteger>>hashMultiply."

	| byteArraySize hash low |
	byteArraySize _ aByteArray size.
	hash _ speciesHash bitAnd: 16rFFFFFFF.
	1 to: byteArraySize do: [:pos |
		hash _ hash + (aByteArray basicAt: pos).
		"Begin hashMultiply"
		low _ hash bitAnd: 16383.
		hash _ (16r260D * low + ((16r260D * (hash bitShift: -14) + (16r0065 * low) bitAnd: 16383) * 16384)) bitAnd: 16r0FFFFFFF.
	].
	^ hash