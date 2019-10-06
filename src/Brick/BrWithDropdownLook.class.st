Class {
	#name : #BrWithDropdownLook,
	#superclass : #BrWithAnchoredLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> hideWishClass [
	^ BrDropdownHideWish
]

{ #category : #initialization }
BrWithDropdownLook >> initialize [
	super initialize.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | 
			self visible
				ifTrue: [ self hide ].
			self show ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventHandler: clickEventHandler ];
				down: [ :e | widget removeEventHandler: clickEventHandler ];
				yourself)
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> relocateWish [
	^ BrDropdownRelocateWish new
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> stencilChangedClass [
	^ BrDropdownStencilChanged
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> stencilRequest [
	^ BrDropdownStencilRequest new
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> visibleChangedClass [
	^ BrDropdownVisibleChanged
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> visibleRequest [
	^ BrDropdownVisibleRequest new
]
