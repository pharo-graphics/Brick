Class {
	#name : #BrScrollbarSkin,
	#superclass : #BrSkin,
	#instVars : [
		'thumb',
		'thumbLength',
		'trackLength',
		'incrementButton',
		'decrementButton',
		'track',
		'slideDelta'
	],
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> breadthOf: aTarget [
	^ self orientation breadthOf: aTarget
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> createDecButton [
	^ self orientation layoutDecButton: (BrScrollbarButton new
		size: 10 @ 10;
		addEventHandler:
			(BlEventHandler on: BlMouseStillDownEvent
				do: [:evt| self controller decrementButtonPressed: evt ]))
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> createIncButton [
	^ self orientation layoutIncButton:(BrScrollbarButton new 
		size: 10 @ 10;
		addEventHandler:
			(BlEventHandler on: BlMouseStillDownEvent
				do: [:evt| self controller incrementButtonPressed: evt ]))
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> createThumb [
	^ (BrScrollbarThumb scrollbar: self)
		size: 10 @ 10;
		background: Color lightGray;
		addEventHandler: (BlEventHandler on:BlDragStartEvent do:[:evt| self thumbDragStart: evt position]);
		addEventHandler: (BlEventHandler on:BlDragEvent do:[:evt| self thumbDragged: evt position])
		yourself
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> createTrack [
	^ self orientation layoutTrack: (BlElement new
		styleClass: #track;
		border: (BlBorder paint: Color lightGray width: 1);
		addEventHandler: (BlEventHandler on:BlScrollEvent do:[:evt| self trackMouseWheel: evt]);
		addEventHandler: (BlEventHandler on:BlMouseStillDownEvent do:[:evt| self trackMouseDown: evt]);
		yourself)
]

{ #category : #initialization }
BrScrollbarSkin >> initializeSkin [
	super initializeSkin.
	widget
		styleClass: #scrollbar;
		size: 10@10;
		layout: self orientation defaultLayout.
	self orientation layoutWidget: widget.
	self orientation for: widget length: 10.
	thumb := self createThumb.
	track := self createTrack.
	decrementButton := self createDecButton.
	incrementButton := self createIncButton.
	
	widget scrollValueProperty onChangedDo: [ :v | self positionThumb ].
	widget maxProperty onChangedDo: [ :v | self positionThumb ].
	widget minProperty onChangedDo: [ :v | self positionThumb ].
	widget visibleAmountProperty onChangedDo: [ :v | self positionThumb ].
	widget unitIncrementProperty onChangedDo: [ :v | self positionThumb ].
	widget blockIncrementProperty onChangedDo: [ :v | self positionThumb ].
	widget withButtonsProperty onChangedDo: [ :v | self showButtons: v ]
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> lengthOf: aTarget [
	^ self orientation lengthOf: aTarget
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> minThumbLength [
	^ self orientation minLengthOf: thumb
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> orientation [
	^ widget orientation
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> positionThumb [
	| allowedValue currentPosition trackPos |
	self orientation for: thumb length: self thumbLength.
	self orientation for: track breadth: (self breadthOf: thumb).
	allowedValue := widget scrollValue min: widget max max: widget min.
	currentPosition := self orientation positionFromPoint: thumb position.
	trackPos := allowedValue / widget max * self trackLength.
	trackPos > currentPosition
		ifTrue: [ trackPos := trackPos - currentPosition ]
		ifFalse: [ trackPos := (currentPosition - trackPos) negated ].
	self orientation translate: thumb by: trackPos
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> showButtons: aBoolean [
	aBoolean
		ifTrue:
			[ widget children size = 3
				ifTrue: [ ^ self ].
			widget
				addChildFirst: decrementButton ;
				addChild: incrementButton ]
		ifFalse:
			[ widget children size > 3
				ifTrue: [ ^ self ].
			widget
				removeChild: decrementButton;
				removeChild: incrementButton ]
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> thumbDragStart: aPoint [
	| handThumbPos |
	handThumbPos := self orientation positionFromPoint: (thumb globalPointToLocal: aPoint).
	self trackLength isZero
		ifTrue: [ slideDelta := 0 ]
		ifFalse: [ slideDelta := handThumbPos / self trackLength ]
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> thumbDragged: aPoint [
| handTrackPos trackPercent deltaPercent |
	self trackLength isZero ifTrue:[^ self].
	handTrackPos := self orientation positionFromPoint: (track globalPointToLocal: aPoint).
	trackPercent := handTrackPos / self trackLength.
	deltaPercent := slideDelta.
	self controller thumbDraggedPosition: trackPercent - deltaPercent
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> thumbLength [
	^ self visiblePortion * (self lengthOf:track) min: (self lengthOf:track) max: self minThumbLength
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> trackLength [
	^ (self lengthOf: track) - self thumbLength
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> trackMouseDown: anEvent [
	| localPosition percentPosition |
	
	localPosition := self orientation positionFromPoint: (track globalPointToLocal: anEvent position).
	percentPosition := (localPosition - (self thumbLength / 2)) / self trackLength.
	self controller trackPressPosition: percentPosition
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> trackMouseWheel: anEvent [

	anEvent isScrollDown
		ifTrue: [ self controller incrementValue ].
	anEvent isScrollUp
		ifTrue: [ self controller decrementValue ]
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> updateChildren [
	super updateChildren.
	track addChild: thumb.
	widget addChild: track.
	self showButtons: widget withButtons.
	self orientation for: thumb length: self thumbLength.
	self orientation for: track breadth: (self breadthOf: thumb).
]

{ #category : #'as yet unclassified' }
BrScrollbarSkin >> visiblePortion [
	^ widget visibleAmount / (widget max - widget min)
]
