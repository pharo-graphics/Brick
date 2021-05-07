Class {
	#name : #BrBasicScrollbarAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'scrollbar',
		'scrollable',
		'thumbStencil',
		'trackStencil'
	],
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #initialization }
BrBasicScrollbarAptitude >> beHorizontal [
	| aCurrentScrollbar |
	scrollbar class = BlHorizontalScrollbarElement ifTrue: [ ^ self ].
	aCurrentScrollbar := scrollbar.
	aCurrentScrollbar detach.
	scrollbar := BlHorizontalScrollbarElement new.
	self initializeScrollbar: scrollbar.
	self replaceScrollbarElement: aCurrentScrollbar by: scrollbar.
]

{ #category : #initialization }
BrBasicScrollbarAptitude >> beVertical [
	| aCurrentScrollbar |
	scrollbar class = BlVerticalScrollbarElement ifTrue: [ ^ self ].
	aCurrentScrollbar := scrollbar.
	aCurrentScrollbar detach.
	scrollbar := BlVerticalScrollbarElement new.
	self initializeScrollbar: scrollbar.
	self replaceScrollbarElement: aCurrentScrollbar by: scrollbar.
]

{ #category : #initialization }
BrBasicScrollbarAptitude >> initialize [
	super initialize.
	
	self initializeScrollbar.
	self addChangeAddChildAs: #(content scrollbar) with: [ scrollbar ].
	
	self add: (BrScrollbarOrientationAptitude new
		horizontal: [ :aStyle | aStyle do: [ :aWidget | self beHorizontal ] ];
		vertical: [ :aStyle | aStyle do: [ :aWidget | self beVertical ] ])
]

{ #category : #initialization }
BrBasicScrollbarAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrScrollbarScrollableChanged do: [ :anEvent |
		"by defualt is not assigned in the model"
		anEvent scrollableElement
			ifNotNil: [ :aScrollable | self scrollableChanged: aScrollable ] ].
	self when: BrScrollbarThumbChanged do: [ :anEvent | self thumbChanged: anEvent stencil ].
	self when: BrScrollbarTrackChanged do: [ :anEvent | self trackChanged: anEvent stencil ].
]

{ #category : #initialization }
BrBasicScrollbarAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrScrollbarThumbRequest new.
	self request: BrScrollbarTrackRequest new.
	self request: BrScrollbarScrollableRequest new.
]

{ #category : #initialization }
BrBasicScrollbarAptitude >> initializeScrollbar [
	scrollbar := BlVerticalScrollbarElement new.
	self initializeScrollbar: scrollbar.
]

{ #category : #initialization }
BrBasicScrollbarAptitude >> initializeScrollbar: aScrollbar [
	
	scrollable
		ifNotNil: [ aScrollbar attachTo: scrollable ].

	thumbStencil
		ifNotNil: [ aScrollbar thumb: thumbStencil asElement removeFromParent ].

	trackStencil
		ifNotNil: [ aScrollbar track: trackStencil asElement removeFromParent ].
]

{ #category : #'private - updating' }
BrBasicScrollbarAptitude >> replaceScrollbarElement: anOldScrollbar by: aNewScrollbar [
	self widgetDo: [ :aWidget |
		| aParent |
		aParent := anOldScrollbar parent.
		aParent replaceChild: anOldScrollbar with: aNewScrollbar as: #scrollbar. ]
]

{ #category : #'event handling' }
BrBasicScrollbarAptitude >> scrollableChanged: aTBlScrollable [
	scrollable := aTBlScrollable.
	scrollbar attachTo: aTBlScrollable
]

{ #category : #'event handling' }
BrBasicScrollbarAptitude >> thumbChanged: aStencil [
	thumbStencil := aStencil.
	scrollbar thumb: thumbStencil asElement
]

{ #category : #'event handling' }
BrBasicScrollbarAptitude >> trackChanged: aStencil [
	trackStencil := aStencil.
	scrollbar track: trackStencil asElement
]
