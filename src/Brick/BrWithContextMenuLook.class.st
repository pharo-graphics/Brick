Class {
	#name : #BrWithContextMenuLook,
	#superclass : #BrWithAnchoredLook,
	#instVars : [
		'position',
		'clickEventHandler',
		'mouseButton'
	],
	#category : #'Brick-Context Menu - Look'
}

{ #category : #'as yet unclassified' }
BrWithContextMenuLook class >> anchoredLookClass [
	^ BrContextMenuLook
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> hideWishClass [
	^ BrContextMenuHideWish
]

{ #category : #initialization }
BrWithContextMenuLook >> initialize [
	super initialize.
	mouseButton := BlMouseButton secondary.
	
	clickEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			e button = mouseButton
				ifTrue: [ self visible
						ifTrue: [ self hide ].
					position := e localPosition.
					self show ] ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventHandler: clickEventHandler ];
				down: [ :e | widget removeEventHandler: clickEventHandler ];
				yourself)
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> relocateWish [
	^ BrContextMenuRelocateWish new
		position: position;
		yourself
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> showWishClass [
	^ BrContextMenuShowWish
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> stencilChangedClass [
	^ BrContextMenuStencilChanged
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> stencilRequest [
	^ BrContextMenuStencilRequest new
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> usePrimaryMouseButton [
	mouseButton := BlMouseButton primary
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> visibleChangedClass [
	^ BrContextMenuVisibleChanged
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> visibleRequest [
	^ BrContextMenuVisibleRequest new
]
