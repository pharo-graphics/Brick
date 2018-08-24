Class {
	#name : #BrInnerSpace,
	#superclass : #BlElement,
	#instVars : [
		'fullscreen',
		'resizable',
		'previousRootExtent',
		'previousPosition'
	],
	#category : 'Brick-Experimental-Window'
}

{ #category : #displaying }
BrInnerSpace >> close [
	self space root removeChild: self
]

{ #category : #accessing }
BrInnerSpace >> dirtyAreas [
	^ self space dirtyAreas
]

{ #category : #accessing }
BrInnerSpace >> fullscreen [
	^ 	self fullscreenProperty value
]

{ #category : #accessing }
BrInnerSpace >> fullscreen: anObject [
	self fullscreenProperty value: anObject
]

{ #category : #'accessing properties' }
BrInnerSpace >> fullscreenProperty [
	^ fullscreen ifNil: [ fullscreen := BlObjectProperty on: self named: #fullscreen default: false ]
]

{ #category : #displaying }
BrInnerSpace >> hide [
	self visibility: BlVisibility gone
]

{ #category : #'initialize-release' }
BrInnerSpace >> initialize [
	super initialize.
	self layout: BlLinearLayout vertical.
	self root: BlElement new.
	self constraints horizontal fitContent.
	self constraints vertical fitContent.
	self border: (BlBorder paint: (Color black alpha: 0.2) width: 2).
	"self padding: (BlInsets all: 1)."
	"self
		effect:
			(BlDropShadowEffect new
				offset: 0.5 @ 0.5;
				width: 1;
				color: (Color black alpha: 0.5))."
	self
		addEventHandler: BrResizeEventListener new
]

{ #category : #displaying }
BrInnerSpace >> maximize [
	self resizable
		ifFalse: [ ^ self ].
		
	self constraints vertical resizer ifMatchParent: [ 
			self relocate: previousPosition.
			self root extent: previousRootExtent.
			self constraints horizontal fitContent.
			^ self constraints vertical fitContent ];
		ifFitContent: [ 
			previousRootExtent := self root extent.
			previousPosition := self position.
			self relocate: 0@0.
			self root constraints horizontal matchParent.
			self root constraints vertical matchParent.
			self constraints horizontal matchParent.
			^ self constraints vertical matchParent]
]

{ #category : #displaying }
BrInnerSpace >> minimize [ 
]

{ #category : #'focus managing' }
BrInnerSpace >> requestFocusFor: anElement [
	^ self space requestFocusFor: anElement
]

{ #category : #accessing }
BrInnerSpace >> resizable [
	^ self resizableProperty value
]

{ #category : #accessing }
BrInnerSpace >> resizable: anObject [
	self resizableProperty value: anObject
]

{ #category : #'accessing properties' }
BrInnerSpace >> resizableProperty [
	^ resizable ifNil: [ resizable := BlObjectProperty on: self named: #resizable default: true ]
]

{ #category : #accessing }
BrInnerSpace >> root [
	^ self children at: 1 ifAbsent: [ nil ]
]

{ #category : #accessing }
BrInnerSpace >> root: aRootChild [
	aRootChild space: self.
	self
		removeChildren;
		addChild: aRootChild
]

{ #category : #displaying }
BrInnerSpace >> show [
	self space root addChild: self
]

{ #category : #'as yet unclassified' }
BrInnerSpace >> updateCursorFromEvent: anEvent [
	|lPos isTop isBottom isLeft isRight |
	lPos := self globalPointToLocal: anEvent position.
	isTop := (lPos y < 8).
	isBottom := (lPos y >  (self height - 8)).
	isLeft := (lPos x < 8).
	isRight := (lPos x >  (self width - 8)).
	
	isTop ifTrue:[
			isLeft ifTrue:[^ self mouseCursor: BlCursor resizeTopLeft ].
			isRight ifTrue:[^ self mouseCursor: BlCursor resizeTopRight ].
			^ self mouseCursor: BlCursor resizeTop 
		].
	isBottom ifTrue:[
			isLeft ifTrue:[^ self mouseCursor: BlCursor resizeBottomLeft ].
			isRight ifTrue:[^ self mouseCursor: BlCursor resizeBottomRight ].
			^ self mouseCursor: BlCursor resizeBottom 
		].
	isLeft ifTrue:[^ self mouseCursor: BlCursor resizeLeft].
	isRight ifTrue:[^ self mouseCursor: BlCursor resizeRight]
]

{ #category : #'as yet unclassified' }
BrInnerSpace >> updateSizeFromEvent: anEvent [
	| lPos |
	lPos := self globalPointToLocal: anEvent position.
	 
]

{ #category : #'as yet unclassified' }
BrInnerSpace >> virtualScreenPositionForEvent: anEvent [
	^ anEvent position
]
