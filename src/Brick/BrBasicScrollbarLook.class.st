Class {
	#name : #BrBasicScrollbarLook,
	#superclass : #BrLook,
	#instVars : [
		'scrollbar',
		'orientation',
		'scrollable',
		'thumbStencil',
		'trackStencil'
	],
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #initialization }
BrBasicScrollbarLook >> buildNewScrollbar [
	| aScrollbar |
	
	aScrollbar := orientation isVertical
		ifTrue: [ BlVerticalScrollbarElement new ]
		ifFalse: [ BlHorizontalScrollbarElement new ].

	scrollable
		ifNotNil: [ aScrollbar attachTo: scrollable ].

	thumbStencil
		ifNotNil: [ aScrollbar thumb: thumbStencil asElement removeFromParent ].

	trackStencil
		ifNotNil: [ aScrollbar track: trackStencil asElement removeFromParent ].

	^ aScrollbar
]

{ #category : #initialization }
BrBasicScrollbarLook >> initialize [
	super initialize.
	
	scrollable := nil.
	orientation := BrScrollbarOrientationState vertical.
	trackStencil := nil.
	thumbStencil := nil.
	
	scrollbar := self buildNewScrollbar.
	self addChangeAddChildAs: #(content scrollbar) with: [ scrollbar ].
]

{ #category : #initialization }
BrBasicScrollbarLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrScrollbarOrientationChanged do: [ :anEvent | self orientationChanged: anEvent orientation ].
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
	
	self request: BrScrollbarOrientationRequest new.
	self request: BrScrollbarThumbRequest new.
	self request: BrScrollbarTrackRequest new.
	self request: BrScrollbarScrollableRequest new
]

{ #category : #'event handling' }
BrBasicScrollbarLook >> orientationChanged: aScrollbarOrientation [
	| aCurrentScrollbar |

	orientation = aScrollbarOrientation
		ifTrue: [ ^ self ].
		
	orientation := aScrollbarOrientation.
	
	aCurrentScrollbar := scrollbar.
	aCurrentScrollbar detach.

	scrollbar := self buildNewScrollbar.
	
	aCurrentScrollbar hasParent
		ifTrue: [ aCurrentScrollbar parent replaceChild: aCurrentScrollbar with: scrollbar ]
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
