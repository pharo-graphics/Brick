updating
updateChildren
	super updateChildren.
	
	self
		assert: [ mark parent isNil or: [ mark parent == box ] ]
		description: [ 'Mark must be a child of a box' ].
	
	self flag: 'Why do we need to re-add mark to box?'.
	mark parent == box
		ifTrue: [ box removeChild: mark ].

	box addChild: mark.
	widget addChildFirst: box