Class {
	#name : #BrWithDropdownLook,
	#superclass : #BrWithAnchoredLook,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'as yet unclassified' }
BrWithDropdownLook class >> anchoredLookClass [
	^ BrDropdownLook
]

{ #category : #'host space - displaying' }
BrWithDropdownLook >> hide [
	super hide.
	widget visibility: BlVisibility visible
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> hideWishClass [
	^ BrDropdownHideWish
]

{ #category : #initialization }
BrWithDropdownLook >> initialize [
	super initialize.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | self show ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventFilter: clickEventHandler ];
				down: [ :e | widget removeEventFilter: clickEventHandler ];
				yourself)
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook >> relocateWish [
	^ BrDropdownRelocateWish new
]

{ #category : #'host space - displaying' }
BrWithDropdownLook >> show [
	super show.
	widget visibility: BlVisibility hidden
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
