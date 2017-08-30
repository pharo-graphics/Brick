text - modifications
moveTextBy: aNumber after: aTextIndex
	| aText |

	self
		assert: [ self textInterval rangeIncludes: aTextIndex ]
		description: [ 'Text index must be included in my current text range' ].

	aText := self text.
	aText start: (aText start max: 1) end: aText end + aNumber.

	"no pieces created (they were not requested yet so no need to move them)"
	self hasPieces
		ifFalse: [ ^ self ].

	self pieces
		select: [ :aSubText | (aTextIndex between: aSubText start and: aSubText end) or: [ aSubText start >= aTextIndex ] ]
		thenDo: [ :aSubText |
			(aTextIndex between: aSubText start and: aSubText end)
				ifTrue: [ aSubText start: (aSubText start max: 1) end: aSubText end + aNumber ]
				ifFalse: [ aSubText start: aSubText start + aNumber end: aSubText end + aNumber ] ]