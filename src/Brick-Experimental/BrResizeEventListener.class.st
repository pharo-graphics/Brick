Class {
	#name : #BrResizeEventListener,
	#superclass : #BlElementEventListener,
	#instVars : [
		'isTop',
		'isBottom',
		'isLeft',
		'isRight',
		'target',
		'isDragging'
	],
	#category : 'Brick-Experimental-Window'
}

{ #category : #'mouse handlers' }
BrResizeEventListener >> dragEndEvent: anEvent [
	isDragging := false
]

{ #category : #'mouse handlers' }
BrResizeEventListener >> dragEvent: anEvent [
	isDragging := true.
	 self resizeFromEvent: anEvent
]

{ #category : #initialization }
BrResizeEventListener >> initialize [
	super initialize.
	isDragging := false
]

{ #category : #'mouse handlers' }
BrResizeEventListener >> mouseLeaveEvent: anEvent [
	target mouseCursor: BlCursor default
]

{ #category : #'mouse handlers' }
BrResizeEventListener >> mouseOverEvent: anEvent [
	self updateCursorFromEvent: anEvent
]

{ #category : #installation }
BrResizeEventListener >> onInstalledIn: aTarget [
	target := aTarget
]

{ #category : #resizing }
BrResizeEventListener >> resizeBottom: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	 self root extent:  self root width @ lPos y
]

{ #category : #resizing }
BrResizeEventListener >> resizeBottomLeft: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	 self root extent:  (self root width - (lPos x)) @ lPos y.
	self root windowPosition: aPosition x @ self root windowPosition y.
	
]

{ #category : #resizing }
BrResizeEventListener >> resizeBottomRight: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: lPos 
]

{ #category : #resizing }
BrResizeEventListener >> resizeFromEvent: anEvent [
	| pos |
	pos := anEvent position.
	 
	isTop ifTrue:[
			isLeft ifTrue:[^ self resizeTopLeft: pos].
			isRight ifTrue:[^ self resizeTopRight: pos ].
			^ self resizeTop: pos
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ self resizeBottomLeft: pos].
			isRight ifTrue:[^ self resizeBottomRight: pos ].
			^ self resizeBottom: pos
		].
	isLeft ifTrue:[^ self resizeLeft: pos].
	isRight ifTrue:[^ self resizeRight: pos]
]

{ #category : #resizing }
BrResizeEventListener >> resizeLeft: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: (self root width - (lPos x)) @ self root height.
	self root windowPosition: aPosition x @ self root windowPosition y.
	
]

{ #category : #resizing }
BrResizeEventListener >> resizeRight: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: lPos x @ self root height
]

{ #category : #resizing }
BrResizeEventListener >> resizeTop: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: self root width @ (self root height - lPos y).
	self root windowPosition: self root windowPosition x@ aPosition y.
	
]

{ #category : #resizing }
BrResizeEventListener >> resizeTopLeft: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: (self root width - (lPos x)) @ (self root height - lPos y).
	self root windowPosition: aPosition .
]

{ #category : #resizing }
BrResizeEventListener >> resizeTopRight: aPosition [
	| lPos |
	lPos := target globalPointToLocal: aPosition.
	self root extent: lPos x @ (self root height - lPos y).
	self root windowPosition: self root windowPosition x@ aPosition y.
	
]

{ #category : #installation }
BrResizeEventListener >> root [
	^ target root
]

{ #category : #'as yet unclassified' }
BrResizeEventListener >> updateCursorFromEvent: anEvent [
	|lPos  |
	lPos := target globalPointToLocal: anEvent position.
	isTop := (lPos y < 8).
	isBottom := (lPos y >  (target height - 8)).
	isLeft := (lPos x < 8).
	isRight := (lPos x >  (target width - 8)).
	
	isTop ifTrue:[
			isLeft ifTrue:[^ target mouseCursor: BlCursor resizeTopLeft ].
			isRight ifTrue:[^ target mouseCursor: BlCursor resizeTopRight ].
			^ target mouseCursor: BlCursor resizeTop 
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ target mouseCursor: BlCursor resizeBottomLeft ].
			isRight ifTrue:[^ target mouseCursor: BlCursor resizeBottomRight ].
			^ target mouseCursor: BlCursor resizeBottom 
		].
	isLeft ifTrue:[^ target mouseCursor: BlCursor resizeLeft].
	isRight ifTrue:[^ target mouseCursor: BlCursor resizeRight]
]

{ #category : #'mouse handlers' }
BrResizeEventListener >> wantsEvent: anEvent [
	^ anEvent isBaseDrag or: [ anEvent isMouse and: [ isDragging not ] ]
]
