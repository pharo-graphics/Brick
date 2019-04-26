Class {
	#name : #BrDropdownLookNew,
	#superclass : #BrLook,
	#instVars : [
		'toggleStencil',
		'popupStencil',
		'popupEmbellisher',
		'popupElement',
		'toggleElement',
		'outskirtsEmbellisher',
		'dropdownTargetSelector'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'instance creation' }
BrDropdownLookNew >> createPopupElement [
	"Create a popup element from a stencil and embellish it using outskirts embellisher"
	<return: #BlElement>
	| aPopupElement |

	aPopupElement := (self popupEmbellisher
		toggleStencil: self toggleStencil;
		popupElement: self popupStencil asElement) asElement.

	^ (self outskirtsEmbellisher element: aPopupElement) asElement
]

{ #category : #'instance creation' }
BrDropdownLookNew >> createToggleElement [
	"Create a toggle element from a stencil and embellish it using outskirts embellisher"
	<return: #BlElement>

	^ (self outskirtsEmbellisher element: self toggleStencil asElement) asElement
]

{ #category : #hooks }
BrDropdownLookNew >> dropdownCollapsed [

	self isExpanded
		ifFalse: [ ^ self ].

	toggleElement visibility: BlVisibility visible.

	self popupElement removeFromParent.
	popupElement := nil
]

{ #category : #hooks }
BrDropdownLookNew >> dropdownExpanded [
	self isExpanded
		ifTrue: [ ^ self ].

	toggleElement visibility: BlVisibility hidden.

	self widgetDo: [ :aWidget |
		aWidget isAttachedToSceneGraph
			ifTrue: [
				(dropdownTargetSelector cull: aWidget) addChild: (popupElement := self createPopupElement).
				
				(popupElement childNamed: #toggle) dispatchEvent: (BrExpansionWish expand).
				
				self relocatePopup ] ]
]

{ #category : #accessing }
BrDropdownLookNew >> dropdownTarget: aBlock [
	dropdownTargetSelector := aBlock
]

{ #category : #'element handlers' }
BrDropdownLookNew >> elementPositionInSpaceChanged: anEvent [
	self relocatePopup
]

{ #category : #initialization }
BrDropdownLookNew >> initialize [
	super initialize.

	toggleStencil := BrDropdownModel defaultToggleStencil.
	popupStencil := BrDropdownModel defaultPopupStencil.

	popupEmbellisher := BrDropdownPopupEmbellisher new.
	outskirtsEmbellisher := BrDropdownOutskirtsEmbellisher new.
	
	dropdownTargetSelector := [ :aWidget | aWidget space ].
	
	self add: (BrInteractiveCommonLook new
		collapsed: [ self dropdownCollapsed ];
		expanded: [ self dropdownExpanded ])
]

{ #category : #initialization }
BrDropdownLookNew >> initializeListeners [
	super initializeListeners.

	self when: BrDropdownPopupStencilChanged do: [ :anEvent | self popupStencil: anEvent stencil ].
	self when: BrDropdownToggleStencilChanged do: [ :anEvent | self toggleStencil: anEvent stencil ]
]

{ #category : #initialization }
BrDropdownLookNew >> initializeLook [
	super initializeLook.

	self initializeToggleElement
]

{ #category : #initialization }
BrDropdownLookNew >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownPopupStencilRequest new.
	self request: BrDropdownToggleStencilRequest new.
]

{ #category : #initialization }
BrDropdownLookNew >> initializeToggleElement [
	toggleElement ifNotNil: #removeFromParent.
	self widget addChild: (toggleElement := self createToggleElement)
]

{ #category : #testing }
BrDropdownLookNew >> isExpanded [
	<return: #Boolean>

	^ popupElement isNotNil and: [ popupElement isAttachedToSceneGraph ]
]

{ #category : #accessing }
BrDropdownLookNew >> outskirtsEmbellisher [
	^ outskirtsEmbellisher
]

{ #category : #accessing }
BrDropdownLookNew >> outskirtsEmbellisher: anObject [
	outskirtsEmbellisher := anObject asStencilBuilder: BrDropdownOutskirtsEmbellisher
]

{ #category : #accessing }
BrDropdownLookNew >> popupElement [
	<return: #BlElement>

	^ popupElement
]

{ #category : #accessing }
BrDropdownLookNew >> popupEmbellisher [
	^ popupEmbellisher
]

{ #category : #accessing }
BrDropdownLookNew >> popupEmbellisher: anObject [
	popupEmbellisher := anObject  asStencilBuilder: BrDropdownPopupEmbellisher
]

{ #category : #geometry }
BrDropdownLookNew >> popupPosition [
	"Return a popup position relative to the on space coordinates"
	<return: #Point>
	| boundsInSpace |

	boundsInSpace := self widget bounds inSpace.
	^ (self popupElement globalPointToParent: boundsInSpace position)
]

{ #category : #accessing }
BrDropdownLookNew >> popupStencil [
	<return: #BrStencil>

	^ popupStencil
]

{ #category : #accessing }
BrDropdownLookNew >> popupStencil: aBrStencil [
	popupStencil := aBrStencil asStencil
]

{ #category : #geometry }
BrDropdownLookNew >> relocatePopup [
	self isExpanded
		ifFalse: [ ^ self ].

	self popupElement relocate: self popupPosition
]

{ #category : #accessing }
BrDropdownLookNew >> toggleStencil [
	<return: #BrStencil>

	^ toggleStencil
]

{ #category : #accessing }
BrDropdownLookNew >> toggleStencil: aBrStencil [
	toggleStencil := aBrStencil asStencil.
	self widgetDo: [ self initializeToggleElement ]
]
