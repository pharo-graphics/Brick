Class {
	#name : #BrDropdownLook,
	#superclass : #BrLook,
	#instVars : [
		'toggleStencil',
		'popupStencil',
		'popupEmbellisher',
		'outskirtsEmbellisher',
		'popupElement',
		'toggleElement',
		'collapseEventHandler',
		'expandEventHandler',
		'reusePopup'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #hooks }
BrDropdownLook >> collapsed [
	self isExpanded
		ifFalse: [ ^ self ].
	self
		widgetDo: [ :e | 
			e isAttachedToSceneGraph
				ifTrue: [ e space root removeEventFilter: collapseEventHandler ] ].
	toggleElement visibility: BlVisibility visible.
	popupElement removeFromParent.
]

{ #category : #'instance creation' }
BrDropdownLook >> createPopupElement [
	"Create a popup element from a stencil"

	<return: #BlElement>
	| aPopupElement |
	aPopupElement := (self popupEmbellisher
		toggleStencil: self toggleStencil;
		popupStencil: self popupStencil;
		anchor: toggleElement) asElement
		constraintsDo: [ :c | c ignoreByLayout ];
		yourself.
	^ (self outskirtsEmbellisher element: aPopupElement) asElement
]

{ #category : #'instance creation' }
BrDropdownLook >> createToggleElement [
	"Create a toggle element from a stencil"

	<return: #BlElement>
	^ (self outskirtsEmbellisher element: self toggleStencil asElement)
		asElement
]

{ #category : #'element handlers' }
BrDropdownLook >> elementPositionInSpaceChanged: anEvent [
	self relocatePopup
]

{ #category : #hooks }
BrDropdownLook >> expanded [
	self isExpanded
		ifTrue: [ ^ self ].
	toggleElement visibility: BlVisibility hidden.
	self
		widgetDo: [ :aWidget | 
			aWidget isAttachedToSceneGraph
				ifTrue: [ aWidget space
						addChild:
							((popupElement isNil or: [ reusePopup not ])
								ifTrue: [ popupElement := self createPopupElement ]
								ifFalse: [ popupElement removeFromParent ]).
					self relocatePopup ].
			aWidget space root addEventFilter: collapseEventHandler ]
]

{ #category : #initialization }
BrDropdownLook >> initialize [
	super initialize.
	reusePopup := false.
	collapseEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | 
			(e target ~~ toggleElement
				and: [ (e target hasParent: toggleElement) not
						and: [ e target ~~ popupElement
								and: [ (e target hasParent: popupElement) not ] ] ])
				ifTrue: [ self widget collapse ] ].
	expandEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | self widget toggle ].
	toggleStencil := BrDropdownModel defaultToggleStencil.
	popupStencil := BrDropdownModel defaultPopupStencil.
	popupEmbellisher := BrDropdownPopupEmbellisher new.
	outskirtsEmbellisher := BrDropdownOutskirtsEmbellisher new.
	self
		add:
			(BrInteractiveCommonLook new
				collapsed: [ self collapsed ];
				expanded: [ self expanded ]).
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self collapsed.
					toggleElement := self createToggleElement.
					self widget addChild: toggleElement ];
				down: [ :e | 
					self collapsed.
					toggleElement ifNotNil: #removeFromParent.
					toggleElement := nil ];
				yourself)
]

{ #category : #initialization }
BrDropdownLook >> initializeListeners [
	super initializeListeners.

	self when: BrDropdownPopupStencilChanged do: [ :anEvent | self popupStencil: anEvent stencil ].
	self when: BrDropdownToggleStencilChanged do: [ :anEvent | self toggleStencil: anEvent stencil ]
]

{ #category : #initialization }
BrDropdownLook >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownPopupStencilRequest new.
	self request: BrDropdownToggleStencilRequest new.
]

{ #category : #testing }
BrDropdownLook >> isExpanded [
	<return: #Boolean>

	^ popupElement isNotNil and: [ popupElement isAttachedToSceneGraph ]
]

{ #category : #accessing }
BrDropdownLook >> outskirtsEmbellisher [
	^ outskirtsEmbellisher
]

{ #category : #accessing }
BrDropdownLook >> outskirtsEmbellisher: anObject [
	outskirtsEmbellisher := anObject
		asStencilBuilder: BrDropdownOutskirtsEmbellisher
]

{ #category : #accessing }
BrDropdownLook >> popupElement [
	^ popupElement
]

{ #category : #accessing }
BrDropdownLook >> popupEmbellisher [
	^ popupEmbellisher
]

{ #category : #accessing }
BrDropdownLook >> popupEmbellisher: anObject [
	popupEmbellisher := anObject  asStencilBuilder: BrDropdownPopupEmbellisher
]

{ #category : #accessing }
BrDropdownLook >> popupStencil [
	<return: #BrStencil>

	^ popupStencil
]

{ #category : #accessing }
BrDropdownLook >> popupStencil: aBrStencil [
	popupStencil := aBrStencil asStencil
]

{ #category : #geometry }
BrDropdownLook >> relocatePopup [
	self isExpanded
		ifFalse: [ ^ self ].
	popupEmbellisher relocatePopup
]

{ #category : #accessing }
BrDropdownLook >> reusePopup [
	^ reusePopup
]

{ #category : #accessing }
BrDropdownLook >> reusePopup: anObject [
	reusePopup := anObject
]

{ #category : #accessing }
BrDropdownLook >> toggleStencil [
	<return: #BrStencil>

	^ toggleStencil
]

{ #category : #accessing }
BrDropdownLook >> toggleStencil: aBrStencil [
	toggleStencil := [ aBrStencil asStencil asElement
		addEventHandler: expandEventHandler;
		yourself ] asStencil.
	self
		widgetDo: [ :e | 
			toggleElement ifNotNil: #removeFromParent.
			toggleElement := self createToggleElement.
			e addChild: toggleElement ]
]
