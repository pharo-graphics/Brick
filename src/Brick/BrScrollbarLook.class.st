Class {
	#name : #BrScrollbarLook,
	#superclass : #BrBasicScrollbarLook,
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #initialization }
BrScrollbarLook >> initialize [
	super initialize.
	
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].
	
	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aWidget | aWidget
			constraintsDo: [ :c |
				c vertical fitContent.
				c horizontal matchParent ] ];
		vertical: [ :aWidget | aWidget
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal fitContent ] ])
]
