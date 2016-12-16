as yet unclassified
updateChildren
	super updateChildren.
	
	self
		assert: [ bar parent isNil or: [ bar parent == box ] ]
		description: [ 'Bar must be a child of a box' ].
	
	self flag: 'Why do we need to re-add bar to box?'.
	bar parent == box
		ifTrue: [ box removeChild: bar ].

	self
		assert: [ thumb parent isNil or: [ thumb parent == box ] ]
		description: [ 'Thumb must be a child of a box' ].
	
	self flag: 'Why do we need to re-add thumb to box?'.
	thumb parent == box
		ifTrue: [ box removeChild: thumb ].
	
	box addChildren: {bar.thumb}.
	widget addChildFirst: box.