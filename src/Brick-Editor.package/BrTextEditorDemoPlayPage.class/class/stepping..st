instance creation
stepping: aCollectionOfString
	^ self of: (aCollectionOfString inject: OrderedCollection new into: [ :aCollection :anAddition |
		aCollection
			ifEmpty: [ aCollection add: anAddition ]
			ifNotEmpty: [ aCollection add: (aCollection last, String cr, anAddition) ].
		aCollection
	])