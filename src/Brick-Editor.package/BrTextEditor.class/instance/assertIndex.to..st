asserting
assertIndex: aFromIndex to: aToIndex
	self
		assert: [ aFromIndex >= 0 ]
		description: [ '"from" index must not be negative' ].
		
	self
		assert: [ aToIndex >= 0 ]
		description: [ '"to" index must not be negative' ].
		
	self
		assert: [ aFromIndex <= self text size ]
		description: [ '"from" index must be smaller or equal to text size' ].
		
	self
		assert: [ aToIndex <= self text size ]
		description: [ '"to" index must be smaller or equal to text size' ].
		
	self
		assert: [ aFromIndex <= aToIndex ]
		description: [ '"from" index must be smaller or equal to "to" index' ].