Class {
	#name : #BrProgressWithBarLook,
	#superclass : #BrProgressLook,
	#category : #'Brick-Progress - Look'
}

{ #category : #initialization }
BrProgressWithBarLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widgetProgress constraints vertical resizer)
		with: BlLayoutResizer matchParent.
	self
		addChangeProperty: #(widgetProgress constraints horizontal resizer)
		with: BlLayoutResizer matchParent.
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self widgetProgress
						constraintsDo: [ :c | 
							c frame horizontal weight: self fraction.
							c frame horizontal alignLeft.
							c frame vertical alignCenter ] ];
				down: [ :e |  ];
				yourself)
]

{ #category : #'instance creation' }
BrProgressWithBarLook >> newProgressElement [
	^ BlElement new
]

{ #category : #hooks }
BrProgressWithBarLook >> onProgressChanged [
	super onProgressChanged.
	self widgetDo: [ :aWidget | 
		self widgetProgress constraintsDo: [ :c | 
			c frame horizontal weight: self fraction ] ]
]

{ #category : #accessing }
BrProgressWithBarLook >> widgetProgress [
	"Return widget's progress container element"
	<return: #BlElement>

	self
		assert: [ widget isNotNil ]
		description: [ 'I must be attached to the widget first' ].

	"if widget does not have explicit #content container, we treat widget as a container itself"
	^ self widgetContent
		childNamed: self widgetProgressName
		ifFound: [ :anElement | anElement ]
		ifNone: [ | anElement |
			anElement := self newProgressElement.
			self widgetContent addChild: anElement as: self widgetProgressName.
			anElement ]
]

{ #category : #accessing }
BrProgressWithBarLook >> widgetProgressName [
	^ self class widgetProgressName
]
