Class {
	#name : #BrProgressLook,
	#superclass : #BrLook,
	#instVars : [
		'amount',
		'total'
	],
	#category : 'Brick-Progress - Look'
}

{ #category : #accessing }
BrProgressLook class >> widgetProgressName [
	^ #progress
]

{ #category : #accessing }
BrProgressLook >> amount [
	^ amount
]

{ #category : #accessing }
BrProgressLook >> amount: anAmountNumber total: aTotalNumber [
	self
		assert: [ anAmountNumber notNil and: [ aTotalNumber notNil ] ]
		description: [ 'Progress amount and total numbers must be non-nil' ].
	self
		assert: [ anAmountNumber >= 0 and: [ anAmountNumber <= aTotalNumber ] ]
		description: [ 'Progress amount must be pozitive number less or equal to total number' ].

	amount := anAmountNumber.
	total := aTotalNumber.
	self onProgressChanged
]

{ #category : #'accessing-computed' }
BrProgressLook >> fraction [
	^ self amount / self total
]

{ #category : #'instance creation' }
BrProgressLook >> fraction: aNumber [
	self 
		assert: [ aNumber notNil ]
		description: [ 'Progress fraction must be non-nil' ].
	self 
		assert: [ aNumber >= 0 and: [ aNumber <= 1 ] ]
		description: [ 'Progress fraction number must be between 0 and 1' ].
	self amount: aNumber * 100 total: 100
]

{ #category : #initialization }
BrProgressLook >> initialize [
	super initialize.
	amount := 0.
	total := 100.
	changes
		add:
			(#(widgetContent layout)
				asBrLookPropertyChangeWithValue: [ BlFrameLayout new ]).
	changes
		add:
			(#(widgetProgress constraints vertical resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer matchParent).
	changes
		add:
			(#(widgetProgress constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer matchParent).
	changes
		add:
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

{ #category : #initialization }
BrProgressLook >> initializeListeners [
	super initializeListeners.
	
	self 
		addEventHandlerOn: BrProgressChangedEvent 
		do: [ :anEvent | self amount: anEvent amount total: anEvent total ].
]

{ #category : #initialization }
BrProgressLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrProgressStatusRequest new
]

{ #category : #'instance creation' }
BrProgressLook >> newProgressElement [
	^ BlElement new
]

{ #category : #hooks }
BrProgressLook >> onProgressChanged [
	self widgetDo: [ :aWidget | 
		self widgetProgress constraintsDo: [ :c | 
			c frame horizontal weight: self fraction ] ]
]

{ #category : #'accessing-computed' }
BrProgressLook >> percentage [
	^ self amount / self total * 100
]

{ #category : #accessing }
BrProgressLook >> percentage: aNumber [
	self amount: aNumber total: 100
]

{ #category : #accessing }
BrProgressLook >> total [
	^ total
]

{ #category : #accessing }
BrProgressLook >> widgetProgress [
	"Return widget's progress container element"
	<return: #BlElement>

	self
		assert: [ widget isNotNil ]
		description: [ 'I must be attached to the widget first' ].

	"if widget does not have explicit #content container, we treat widget as a container itself"
	self widgetContent
		childNamed: self widgetProgressName
		ifFound: [ :anElement | ^ anElement ]
		ifNone: [ | anElement |
			anElement := self newProgressElement.
			self widgetContent addChild: anElement as: self widgetProgressName.
			^ anElement ]
]

{ #category : #accessing }
BrProgressLook >> widgetProgressName [
	^ self class widgetProgressName
]
