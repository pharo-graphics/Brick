Class {
	#name : #OLDBrDropdownLook,
	#superclass : #BrLook,
	#instVars : [
		'toggleStencil',
		'popupStencil',
		'popupEmbellisher',
		'outskirtsEmbellisher',
		'popupElement',
		'toggleElement',
		'reusePopup',
		'clickOutsideEventHandler',
		'clickToggleEventHandler',
		'pressEscEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #hooks }
OLDBrDropdownLook >> collapsed [
	self isExpanded
		ifFalse: [ ^ self ].
	self
		widgetDo: [ :e | 
			e isAttachedToSceneGraph
				ifTrue: [ e topMostParent
						removeEventFilter: clickOutsideEventHandler;
						removeEventHandler: clickOutsideEventHandler ] ].
	toggleElement visibility: BlVisibility visible.
	popupElement removeFromParent
]

{ #category : #'instance creation' }
OLDBrDropdownLook >> createPopupElement [
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
OLDBrDropdownLook >> createToggleElement [
	"Create a toggle element from a stencil"

	<return: #BlElement>
	^ (self outskirtsEmbellisher element: self toggleStencil asElement)
		asElement
]

{ #category : #'element handlers' }
OLDBrDropdownLook >> elementPositionInSpaceChanged: anEvent [
	self relocatePopup
]

{ #category : #hooks }
OLDBrDropdownLook >> expanded [
	self isExpanded
		ifTrue: [ ^ self ].
	toggleElement visibility: BlVisibility hidden.
	self
		widgetDo: [ :aWidget | 
			aWidget isAttachedToSceneGraph
				ifTrue: [ aWidget topMostParent
						addChild:
							((popupElement isNil or: [ reusePopup not ])
								ifTrue: [ popupElement := self createPopupElement ]
								ifFalse: [ popupElement removeFromParent ]).
					self relocatePopup ].
			aWidget topMostParent
				addEventFilter: clickOutsideEventHandler;
				addEventHandler: pressEscEventHandler ]
]

{ #category : #initialization }
OLDBrDropdownLook >> initialize [
	super initialize.
	reusePopup := false.
	clickOutsideEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | 
			(e target ~~ toggleElement
				and: [ (e target hasParent: toggleElement) not
						and: [ e target ~~ popupElement
								and: [ (e target hasParent: popupElement) not ] ] ])
				ifTrue: [ self widget collapse ] ].
	clickToggleEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | self widget toggle ].
	pressEscEventHandler := BlEventHandler
		on: BlKeyUpEvent
		do: [ :e | 
			e key = BlKeyboardKey escape
				ifTrue: [ self widget collapse ] ].
	toggleStencil := OLDBrDropdownModel defaultToggleStencil.
	popupStencil := OLDBrDropdownModel defaultPopupStencil.
	popupEmbellisher := OLDBrDropdownPopupEmbellisher new.
	outskirtsEmbellisher := OLDBrDropdownOutskirtsEmbellisher new.
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
OLDBrDropdownLook >> initializeListeners [
	super initializeListeners.

	self when: OLDBrDropdownPopupStencilChanged do: [ :anEvent | self popupStencil: anEvent stencil ].
	self when: OLDBrDropdownToggleStencilChanged do: [ :anEvent | self toggleStencil: anEvent stencil ]
]

{ #category : #initialization }
OLDBrDropdownLook >> initializeRequests [
	super initializeRequests.

	self request: OLDBrDropdownPopupStencilRequest new.
	self request: OLDBrDropdownToggleStencilRequest new.
]

{ #category : #testing }
OLDBrDropdownLook >> isExpanded [
	<return: #Boolean>

	^ popupElement isNotNil and: [ popupElement isAttachedToSceneGraph ]
]

{ #category : #accessing }
OLDBrDropdownLook >> outskirtsEmbellisher [
	^ outskirtsEmbellisher
]

{ #category : #accessing }
OLDBrDropdownLook >> outskirtsEmbellisher: anObject [
	outskirtsEmbellisher := anObject
		asStencilBuilder: OLDBrDropdownOutskirtsEmbellisher
]

{ #category : #accessing }
OLDBrDropdownLook >> popupElement [
	^ popupElement
]

{ #category : #accessing }
OLDBrDropdownLook >> popupEmbellisher [
	^ popupEmbellisher
]

{ #category : #accessing }
OLDBrDropdownLook >> popupEmbellisher: anObject [
	popupEmbellisher := anObject  asStencilBuilder: OLDBrDropdownPopupEmbellisher
]

{ #category : #accessing }
OLDBrDropdownLook >> popupStencil [
	<return: #BrStencil>

	^ popupStencil
]

{ #category : #accessing }
OLDBrDropdownLook >> popupStencil: aBrStencil [
	popupStencil := aBrStencil asStencil
]

{ #category : #geometry }
OLDBrDropdownLook >> relocatePopup [
	self isExpanded
		ifFalse: [ ^ self ].
	popupEmbellisher relocatePopup
]

{ #category : #accessing }
OLDBrDropdownLook >> reusePopup [
	^ reusePopup
]

{ #category : #accessing }
OLDBrDropdownLook >> reusePopup: anObject [
	reusePopup := anObject
]

{ #category : #accessing }
OLDBrDropdownLook >> toggleStencil [
	<return: #BrStencil>

	^ toggleStencil
]

{ #category : #accessing }
OLDBrDropdownLook >> toggleStencil: aBrStencil [
	toggleStencil := [ aBrStencil asStencil asElement
		addEventHandler: clickToggleEventHandler;
		yourself ] asStencil.
	self
		widgetDo: [ :e | 
			toggleElement ifNotNil: #removeFromParent.
			toggleElement := self createToggleElement.
			e addChild: toggleElement ]
]
