Class {
	#name : #BrWithAnchoredLook,
	#superclass : #BrLook,
	#instVars : [
		'container',
		'stencil',
		'clickOutsideEventHandler',
		'pressEscEventHandler',
		'extentChangedEventHandler',
		'positionInSpaceChangedEventHandler'
	],
	#category : #'Brick-Anchored - Look'
}

{ #category : #'as yet unclassified' }
BrWithAnchoredLook class >> anchoredLookClass [
	^ BrAnchoredLook
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook class >> content: anObject [
	^ self
		stencil: [ BlElement new
				look:
					(self anchoredLookClass new
						content: anObject asStencil asElement;
						yourself);
				yourself ]
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook class >> handle: anObject content: anotherObject [
	^ self
		stencil: [ BlElement new
				look:
					(self anchoredLookClass new
						handle: anObject asStencil asElement;
						content: anotherObject asStencil asElement;
						yourself);
				yourself ]
]

{ #category : #accessing }
BrWithAnchoredLook class >> stencil: anObject [
	^ self new
		stencil: anObject;
		yourself
]

{ #category : #testing }
BrWithAnchoredLook >> canHide [
	^ self visible
]

{ #category : #testing }
BrWithAnchoredLook >> canShow [
	^ self visible not
		and: [ widget isNotNil
				and:
					[ widget isAttachedToSceneGraph and: [ widget visibility shouldDraw ] ] ]
]

{ #category : #accessing }
BrWithAnchoredLook >> hide [
	self assert: [ self canHide ].
	widget
		removeEventHandler: extentChangedEventHandler;
		removeEventHandler: positionInSpaceChangedEventHandler.
	container topMostParent
		removeEventFilter: clickOutsideEventHandler;
		removeEventFilter: pressEscEventHandler.
	container
		removeEventHandler: extentChangedEventHandler;
		removeFromParent;
		anchor: nil.
	container := nil
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> hideWishClass [
	self subclassResponsibility
]

{ #category : #initialization }
BrWithAnchoredLook >> initialize [
	super initialize.
	self stencil: [ BlElement new ].
	
	clickOutsideEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			"hide when clicked outside of container"
			((e target ~~ container and: [ (e target hasParent: container) not ])
				and: [ self canHide ])
				ifTrue: [ self hide ] ].
	pressEscEventHandler := BlEventHandler
		on: BlKeyUpEvent
		do: [ :e | 
			"hide when esc pressed"
			e key = BlKeyboardKey escape
				ifTrue: [ self canHide
						ifTrue: [ self hide ] ] ].
	extentChangedEventHandler := BlEventHandler
		on: BlElementExtentChangedEvent
		do: [ :e | 
			"relocate when extent changes"
			self visible
				ifTrue: [ self relocate ] ].
	positionInSpaceChangedEventHandler := BlEventHandler
		on: BlElementPositionInSpaceChangedEvent
		do: [ "relocate when position in space changes"
			self visible
				ifTrue: [ self relocate ] ].
	

	self addChange:
		(BrLookChange new
			up: [ :e |  ];
			down: [ :e | self canHide ifTrue: [ self hide ] ]
			yourself)
]

{ #category : #initialization }
BrWithAnchoredLook >> initializeListeners [
	super initializeListeners.

	self
		when: self stencilChangedClass
		do: [ :e | self stencil: e stencil ].
	self
		when: self visibleChangedClass
		do: [ :e | self visible: e visible ].
		
	self
		when: BlElementPositionInSpaceChangedEvent
		do: [ "relocate when position in space changes"
			self visible
				ifTrue: [ self relocate ] ].

	self
		when: BlElementRemovedFromSceneGraphEvent
		do: [ self canHide ifTrue: [ self hide ] ].

	self
		when: self showWishClass
		do: [ :e | 
			"show on wish"
			(e anchor = widget and: [ self canShow ])
				ifTrue: [ self show ] ].

	self
		when: self hideWishClass
		do: [ :e | 
			"hide on wish"
			(e anchor = widget and: [ self canHide ])
				ifTrue: [ self hide ] ]
]

{ #category : #initialization }
BrWithAnchoredLook >> initializeRequests [
	super initializeRequests.
	self request: self stencilRequest.
	self request: self visibleRequest
]

{ #category : #'host space - displaying' }
BrWithAnchoredLook >> relocate [
	self assert: [ self visible ].
	container
		dispatchEvent:
			(self relocateWish
				anchor: widget;
				yourself)
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> relocateWish [
	self subclassResponsibility
]

{ #category : #'host space - displaying' }
BrWithAnchoredLook >> show [
	self assert: [ self canShow ].
	container := stencil asElement.
	container wantCompositionLayer.

	self flag: 'TODO get rid of having to set anchor'.
	container anchor: widget.
	widget topMostParent addChild: container.
	widget
		addEventHandler: extentChangedEventHandler;
		addEventHandler: positionInSpaceChangedEventHandler.
	container topMostParent
		addEventFilter: clickOutsideEventHandler;
		addEventFilter: pressEscEventHandler.
	container
		addEventHandler: extentChangedEventHandler.
	self relocate
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> showWishClass [
	self subclassResponsibility
]

{ #category : #accessing }
BrWithAnchoredLook >> stencil [
	^ stencil
]

{ #category : #accessing }
BrWithAnchoredLook >> stencil: anObject [
	stencil = anObject
		ifTrue: [ ^ self ].
	stencil := anObject asStencil.
	self canHide
		ifTrue: [ self
				hide;
				show ]
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> stencilChangedClass [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> stencilRequest [
	self subclassResponsibility
]

{ #category : #accessing }
BrWithAnchoredLook >> visible [
	^ container ifNil: [ false ] ifNotNil: #isAttachedToSceneGraph
]

{ #category : #accessing }
BrWithAnchoredLook >> visible: aBoolean [
	aBoolean
		ifTrue: [ self canShow
				ifTrue: [ self show ] ]
		ifFalse: [ self canHide
				ifTrue: [ self hide ] ]
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> visibleChangedClass [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> visibleRequest [
	self subclassResponsibility
]
