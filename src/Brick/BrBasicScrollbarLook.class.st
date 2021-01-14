Class {
	#name : #BrBasicScrollbarLook,
	#superclass : #BrLook,
	#instVars : [
		'scrollbar',
		'scrollable',
		'thumbStencil',
		'trackStencil'
	],
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #initialization }
BrBasicScrollbarLook >> beHorizontal [
	| aCurrentScrollbar |
	scrollbar class = BlHorizontalScrollbarElement ifTrue: [ ^ self ].
	aCurrentScrollbar := scrollbar.
	aCurrentScrollbar detach.
	scrollbar := BlHorizontalScrollbarElement new.
	self initializeScrollbar: scrollbar.
	self replaceScrollbarElement: aCurrentScrollbar by: scrollbar.
]

{ #category : #initialization }
BrBasicScrollbarLook >> beVertical [
	| aCurrentScrollbar |
	scrollbar class = BlVerticalScrollbarElement ifTrue: [ ^ self ].
	aCurrentScrollbar := scrollbar.
	aCurrentScrollbar detach.
	scrollbar := BlVerticalScrollbarElement new.
	self initializeScrollbar: scrollbar.
	self replaceScrollbarElement: aCurrentScrollbar by: scrollbar.
]

{ #category : #initialization }
BrBasicScrollbarLook >> initialize [
	super initialize.
	
	self initializeScrollbar.
	self addChangeAddChildAs: #(content scrollbar) with: [ scrollbar ].
	
	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aStyle | aStyle do: [ :aWidget | self beHorizontal ] ];
		vertical: [ :aStyle | aStyle do: [ :aWidget | self beVertical ] ])
]

{ #category : #initialization }
BrBasicScrollbarLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrScrollbarScrollableChanged do: [ :anEvent |
		"by defualt is not assigned in the model"
		anEvent scrollableElement
			ifNotNil: [ :aScrollable | self scrollableChanged: aScrollable ] ].
	self when: BrScrollbarThumbChanged do: [ :anEvent | self thumbChanged: anEvent stencil ].
	self when: BrScrollbarTrackChanged do: [ :anEvent | self trackChanged: anEvent stencil ].
]

{ #category : #initialization }
BrBasicScrollbarLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrScrollbarThumbRequest new.
	self request: BrScrollbarTrackRequest new.
	self request: BrScrollbarScrollableRequest new.
]

{ #category : #initialization }
BrBasicScrollbarLook >> initializeScrollbar [
	scrollbar := BlVerticalScrollbarElement new.
	self initializeScrollbar: scrollbar.
]

{ #category : #initialization }
BrBasicScrollbarLook >> initializeScrollbar: aScrollbar [
	
	scrollable
		ifNotNil: [ aScrollbar attachTo: scrollable ].

	thumbStencil
		ifNotNil: [ aScrollbar thumb: thumbStencil asElement removeFromParent ].

	trackStencil
		ifNotNil: [ aScrollbar track: trackStencil asElement removeFromParent ].
]

{ #category : #'private - updating' }
BrBasicScrollbarLook >> replaceScrollbarElement: anOldScrollbar by: aNewScrollbar [
	self widgetDo: [ :aWidget |
		| aParent |
		aParent := anOldScrollbar parent.
		aParent replaceChild: anOldScrollbar with: aNewScrollbar as: #scrollbar. ]
]

{ #category : #'event handling' }
BrBasicScrollbarLook >> scrollableChanged: aTBlScrollable [
	scrollable := aTBlScrollable.
	scrollbar attachTo: aTBlScrollable
]

{ #category : #'event handling' }
BrBasicScrollbarLook >> thumbChanged: aStencil [
	thumbStencil := aStencil.
	scrollbar thumb: thumbStencil asElement
]

{ #category : #'event handling' }
BrBasicScrollbarLook >> trackChanged: aStencil [
	trackStencil := aStencil.
	scrollbar track: trackStencil asElement
]
