Class {
	#name : #BrDropdownLook,
	#superclass : #BrLook,
	#instVars : [
		'toggleStencil',
		'popupStencil',
		'popupEmbellisher',
		'popupElement',
		'toggleElement',
		'collapseEventHandler',
		'dropdownTarget'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'instance creation' }
BrDropdownLook >> createPopupElement [
	"Create a popup element from a stencil"

	<return: #BlElement>
	| aPopupElement |
	aPopupElement := (self popupEmbellisher
		toggleStencil: self toggleStencil;
		popupElement: self popupStencil asElement) asElement.
	^ aPopupElement
]

{ #category : #'instance creation' }
BrDropdownLook >> createToggleElement [
	"Create a toggle element from a stencil"

	<return: #BlElement>
	^ self toggleStencil asElement
]

{ #category : #hooks }
BrDropdownLook >> dropdownCollapsed [
	self isExpanded
		ifFalse: [ ^ self ].
	self uninstallCollapseListener.
	toggleElement visibility: BlVisibility visible.
	self popupElement removeFromParent.
	popupElement := nil
]

{ #category : #hooks }
BrDropdownLook >> dropdownExpanded [
	self isExpanded
		ifTrue: [ ^ self ].
	toggleElement visibility: BlVisibility hidden.
	self
		widgetDo: [ :aWidget | 
			aWidget isAttachedToSceneGraph
				ifTrue: [ (dropdownTarget cull: aWidget)
						addChild: (popupElement := self createPopupElement).
					self relocatePopup ] ].
	self installCollapseListener
]

{ #category : #accessing }
BrDropdownLook >> dropdownTarget: anObject [
	dropdownTarget := anObject
]

{ #category : #'element handlers' }
BrDropdownLook >> elementPositionInSpaceChanged: anEvent [
	self relocatePopup
]

{ #category : #initialization }
BrDropdownLook >> initialize [
	super initialize.
	dropdownTarget := #space.
	collapseEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | 
			(e target ~~ toggleElement
				and: [ (e target hasParent: toggleElement) not
						and: [ e target ~~ popupElement
								and: [ (e target hasParent: popupElement) not ] ] ])
				ifTrue: [ self widget collapse ] ].
	toggleStencil := BrDropdownModel defaultToggleStencil.
	popupStencil := BrDropdownModel defaultPopupStencil.
	popupEmbellisher := BrDropdownPopupEmbellisher new.
	self
		add:
			(BrInteractiveCommonLook new
				collapsed: [ self dropdownCollapsed ];
				expanded: [ self dropdownExpanded ]).
	self
		addChange:
			(BrLookChange new
				down: [ :e | 
					self isExpanded
						ifFalse: [ self uninstallCollapseListener ] ];
				yourself).
	self
		addChange:
			(BrLookChange new
				up: [ :e | self initializeToggleElement ];
				down: [ :e | 
					toggleElement ifNotNil: #removeFromParent.
					popupElement ifNotNil: #removeFromParent ];
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

{ #category : #initialization }
BrDropdownLook >> initializeToggleElement [
	toggleElement ifNotNil: #removeFromParent.
	self widget addChild: (toggleElement := self createToggleElement)
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> installCollapseListener [
	self widgetDo: [ :e | e space root addEventFilter: collapseEventHandler ]
]

{ #category : #testing }
BrDropdownLook >> isExpanded [
	<return: #Boolean>

	^ popupElement isNotNil and: [ popupElement isAttachedToSceneGraph ]
]

{ #category : #accessing }
BrDropdownLook >> popupElement [
	<return: #BlElement>

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

{ #category : #geometry }
BrDropdownLook >> popupPosition [
	"Return a popup position relative to the on space coordinates"

	<return: #Point>
	| boundsInSpace |
	boundsInSpace := self widget bounds inSpace.
	^ self popupElement globalPointToParent: boundsInSpace position
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

	self popupElement relocate: self popupPosition
]

{ #category : #accessing }
BrDropdownLook >> toggleStencil [
	<return: #BrStencil>

	^ toggleStencil
]

{ #category : #accessing }
BrDropdownLook >> toggleStencil: aBrStencil [
	toggleStencil := aBrStencil asStencil.
	self widgetDo: [ self initializeToggleElement ]
]

{ #category : #'as yet unclassified' }
BrDropdownLook >> uninstallCollapseListener [
	self
		widgetDo: [ :e | 
			e isAttachedToSceneGraph
				ifTrue: [ e space root removeEventFilter: collapseEventHandler ] ]
]
