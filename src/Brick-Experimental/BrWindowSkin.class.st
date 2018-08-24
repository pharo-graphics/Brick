Class {
	#name : #BrWindowSkin,
	#superclass : #BrSkin,
	#instVars : [
		'systemBar',
		'toolbar',
		'root',
		'sidepane'
	],
	#category : 'Brick-Experimental-Window'
}

{ #category : #'as yet unclassified' }
BrWindowSkin >> defaultLayout [
	^ BlLinearLayout vertical
]

{ #category : #'as yet unclassified' }
BrWindowSkin >> initEventHandlers [
	|dragOffset|
	systemBar addEventHandler: 
		(BlEventHandler on: BlDragStartEvent do: [ :evt | 
			evt consumed: true.
			dragOffset := (widget space virtualScreenPositionForEvent:evt) - widget windowPosition.
			]).
				
	systemBar addEventHandler: 
		(BlEventHandler on: BlDragEvent do: [ :evt | 
			evt consumed: true.
			widget windowPosition: (widget space virtualScreenPositionForEvent:evt) - dragOffset.
			])
]

{ #category : #initialization }
BrWindowSkin >> initializeSkin [
	systemBar := BrSystemBar new
		space: widget;
		background: (BlBackground paint: Color blue).
	systemBar constraintsDo: [ :c | c linear vertical alignTop.
		c linear horizontal alignCenter ].
	
	widget titleProperty onChangedDo: [ :t | self titleChanged ].
	widget rootProperty onChangedDo: [ :r | self rootChanged ].
	widget borderlessProperty onChangedDo: [ :r | self updateChildren ].
	self rootChanged.
	self initEventHandlers
]

{ #category : #'as yet unclassified' }
BrWindowSkin >> rootChanged [
	root := widget root.
	root
		padding: (BlInsets all: 5);
		 constraintsDo: [ :c| c vertical matchParent.
			c horizontal matchParent ]
	
]

{ #category : #'as yet unclassified' }
BrWindowSkin >> titleChanged [
	toolbar title: widget title
]

{ #category : #'as yet unclassified' }
BrWindowSkin >> updateChildren [
	widget removeChildren.
	widget borderless
		ifFalse: [ widget addChild: systemBar ].
	widget addChild:root.
]
