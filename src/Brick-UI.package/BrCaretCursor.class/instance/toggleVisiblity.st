as yet unclassified
toggleVisiblity
	self isVisible
		ifTrue: [ self visibility: BlVisibility hidden ]
		ifFalse: [ self visibility: BlVisibility visible ].
	self invalidate