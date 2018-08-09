accessing
toolbarInAContainer
	<gtExample>
	| aContainer |
	aContainer := BlElement new.
	aContainer layout: BlLinearLayout horizontal.
	aContainer debug: true.
	aContainer constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical fitContent ].
	aContainer addChild: (self removeItemsOnButtonClickVertically debug: true) as: #toolbar.
	^ aContainer