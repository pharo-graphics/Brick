builder - accessing
displayedValue: anObject
	| aDisplayedValue |
	aDisplayedValue := super displayedValue: anObject.
	self styler ifNotNil: [ :aStyler | aStyler style: aDisplayedValue ].
	^ aDisplayedValue