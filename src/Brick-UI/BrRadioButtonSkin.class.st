Class {
	#name : #BrRadioButtonSkin,
	#superclass : #BrLabeledSkin,
	#instVars : [
		'box',
		'mark'
	],
	#category : 'Brick-UI-Radio'
}

{ #category : #initialization }
BrRadioButtonSkin >> createBox [
	^ BrStackPane new
		geometry: BlEllipse new;
		styleClass: #box;
		size: 20 @ 20;
		maxExtent: 20 @ 20;
		minExtent: 20 @ 20
		
]

{ #category : #'as yet unclassified' }
BrRadioButtonSkin >> createMark [
	^ (BlEllipse diameter: 10) asElement
		styleClass: #mark;
		background: Color black;
		constraintsDo:[:c| 
			c frame vertical alignCenter.
			c frame horizontal alignCenter ]
]

{ #category : #'as yet unclassified' }
BrRadioButtonSkin >> initializeSkin [
	super initializeSkin.
	widget styleClass: #radio.
	box := self createBox.
	mark := self createMark.
	
	widget selectedProperty onChangedDo: [ :aBoolean | self markChanged ].
	self markChanged
]

{ #category : #'as yet unclassified' }
BrRadioButtonSkin >> markChanged [
	widget selected
		ifTrue: [ mark visibility: BlVisibility visible ]
		ifFalse: [ mark visibility: BlVisibility hidden ]
]

{ #category : #updating }
BrRadioButtonSkin >> updateChildren [
	super updateChildren.
	
	self
		assert: [ mark parent isNil or: [ mark parent == box ] ]
		description: [ 'Mark must be a child of a box' ].
	
	self flag: 'Why do we need to re-add mark to box?'.
	mark parent == box
		ifTrue: [ box removeChild: mark ].
	
	box addChild: mark.
	widget addChildFirst: box
]
