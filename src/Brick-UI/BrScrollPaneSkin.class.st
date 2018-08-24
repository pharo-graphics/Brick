Class {
	#name : #BrScrollPaneSkin,
	#superclass : #BrSkin,
	#instVars : [
		'vbar',
		'hbar',
		'viewport',
		'positionX',
		'positionY'
	],
	#category : 'Brick-UI-ScrollPane'
}

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> contentMouseWheel: anEvent [
	anEvent isScrollUp
		ifTrue: [ vbar decrement ].
	anEvent isScrollDown
		ifTrue: [ vbar increment ].
	anEvent isScrollLeft
		ifTrue: [ hbar decrement ].
	anEvent isScrollRight
		ifTrue: [ hbar increment ]
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> createHScrollBar [
	^ BrScrollbar horizontal
		constraintsDo: [ :c |
			c horizontal matchParent.
			c frame vertical alignBottom.
			c frame horizontal alignLeft ];
		yourself
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> createVScrollBar [
	^ BrScrollbar vertical
		constraintsDo: [ :c | 
			c vertical matchParent.
			c frame vertical alignTop.
			c frame horizontal alignRight];
		yourself
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> createViewport [
	^ BrScrollPaneViewport new
		background: Color veryLightGray;
		constraintsDo: [ :c | 
			c frame vertical alignTop.
			c frame horizontal alignLeft];
		margin:(BlInsets top: 0 right: 10 bottom: 10 left: 0);
		addEventHandler:
			(BlEventHandler on: BlScrollEvent
				do: [ :evt | self contentMouseWheel: evt ])
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> defaultLayout [
	^ BlFrameLayout new
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> initializeSkin [
	super initializeSkin.
	vbar := self createVScrollBar.
	hbar := self createHScrollBar.
	viewport := self createViewport.
	
	hbar scrollValueProperty onChangedDo: [ :v | self updatePositionX ].
	vbar scrollValueProperty onChangedDo: [ :v | self updatePositionY ].
	
	widget hValueProperty onChangedDo: [ :v | hbar scrollValue: v ].
	widget hMinProperty onChangedDo: [ :v | hbar min: v ].
	widget hMaxProperty onChangedDo: [ :v | hbar max: v ].
	widget vValueProperty onChangedDo: [ :v | vbar scrollValue: v ].
	widget vMinProperty onChangedDo: [ :v | vbar min: v ].
	widget vMaxProperty onChangedDo: [ :v | vbar max: v ].
	widget withButtonsProperty onChangedDo: [ :v |  hbar withButtons: v. vbar withButtons: v ].
	widget contentProperty onChangedDo:[
		viewport removeChildren;addChild: widget content.
		self updateHScrollBar; updateVScrollBar.
		hbar maxWidth: viewport width.
		vbar maxWidth: viewport height.].
	"widget extentProperty onChangedDo:[
		self updateHScrollBar; updateVScrollBar.
		hbar maxWidth: viewport width.
		vbar maxWidth: viewport height.]."
	widget requestLayout
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> updateChildren [
	super updateChildren.
	widget
		removeChildren;
		addChildren:{ hbar. vbar. viewport}
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> updateHScrollBar [
	| contentRatio |
	contentRatio := viewport width / (viewport nodeWidth max:1).
	contentRatio > 0
		ifTrue: [ 
			hbar visibleAmount: contentRatio * (hbar max - hbar min).
			hbar blockIncrement: 0.9 * hbar visibleAmount.
			hbar unitIncrement: 0.1 * hbar visibleAmount ]
		ifFalse: [ hbar visibleAmount: 0.
			hbar blockIncrement: 0.
			hbar unitIncrement: 0 ].
	self updatePositionX
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> updatePositionX [
	| xAxis |
	positionX := hbar scrollValue.
	xAxis :=  viewport position x - (viewport nodeWidth - viewport width) * (positionX/(hbar max - hbar min)).
	widget hValue: (positionX min: widget hMax max: widget hMin).
	widget content relocate: xAxis @ widget content position y
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> updatePositionY [
	| yAxis |
	positionY := vbar scrollValue.
	yAxis :=  viewport position y - (viewport nodeHeight - viewport height) * (positionY/(vbar max - vbar min)).
	widget vValue: (positionY min: widget vMax max: widget vMin).
	widget content relocate: widget content position x @ yAxis
]

{ #category : #'as yet unclassified' }
BrScrollPaneSkin >> updateVScrollBar [
	| contentRatio |
	contentRatio := viewport height / (viewport nodeHeight max:1).
	contentRatio > 0
		ifTrue: [ 
			vbar visibleAmount: contentRatio * (vbar max - vbar min).
			vbar blockIncrement: 0.9 * vbar visibleAmount.
			vbar unitIncrement: 0.1 * vbar visibleAmount ]
		ifFalse: [ vbar visibleAmount: 0.
			vbar blockIncrement: 0.
			vbar unitIncrement: 0 ].
		vbar height: viewport height.
	self updatePositionY
]
