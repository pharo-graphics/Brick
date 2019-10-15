Class {
	#name : #BrWithAnchoredLook,
	#superclass : #BrLook,
	#instVars : [
		'container',
		'stencil',
		'watchDog',
		'clickOutsideEventHandler',
		'pressEscEventHandler',
		'extentChangedEventHandler',
		'positionInSpaceChangedEventHandler',
		'hideEventHandler'
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

{ #category : #accessing }
BrWithAnchoredLook >> hide [
	self assert: [ self visible ].
	widget
		removeEventHandler: extentChangedEventHandler;
		removeEventHandler: positionInSpaceChangedEventHandler.
	container topMostParent
		removeEventFilter: clickOutsideEventHandler;
		removeEventFilter: pressEscEventHandler.
	container
		dequeueTask: watchDog;
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
	watchDog := BlRepeatedTaskAction new
		delay: 500 milliSeconds;
		action: [ "hide when widget removed from scene by checking repeatedly"
			(self visible
				and: [ widget isNil or: [ widget isAttachedToSceneGraph not ] ])
				ifTrue: [ self hide ] ];
		yourself.
	clickOutsideEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			"hide when clicked outside of container"
			(self visible
				and: [ e target ~~ container and: [ (e target hasParent: container) not ] ])
				ifTrue: [ self hide ] ].
	pressEscEventHandler := BlEventHandler
		on: BlKeyUpEvent
		do: [ :e | 
			"hide when esc pressed"
			e key = BlKeyboardKey escape
				ifTrue: [ self visible
						ifTrue: [ self hide ] ] ].
	extentChangedEventHandler := BlEventHandler
		on: BlElementExtentChangedEvent
		do: [ :e | "relocate when extent changes"
			self visible
				ifTrue: [ self relocate ] ].
	positionInSpaceChangedEventHandler := BlEventHandler
		on: BlElementPositionInSpaceChangedEvent
		do: [ "relocate when position in space changes"
			self visible
				ifTrue: [ self relocate ] ].
	hideEventHandler := BlEventHandler
		on: self hideWishClass
		do: [ :e | 
			"hide on wish"
			(self visible and: [ e anchor = widget ])
				ifTrue: [ self hide ] ].
	self
		addChange:
			(BrLookChange new
				up: [ :e |  ];
				down: [ :e | 
					self visible
						ifTrue: [ self hide ] ];
				yourself);
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventHandler: hideEventHandler ];
				down: [ :e | widget removeEventHandler: hideEventHandler ];
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
		do: [ :e | self visible: e visible ]
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
				anchored: container;
				yourself)
]

{ #category : #'as yet unclassified' }
BrWithAnchoredLook >> relocateWish [
	self subclassResponsibility
]

{ #category : #'host space - displaying' }
BrWithAnchoredLook >> show [
	self assert: [ self visible not ].
	container := stencil asElement.
	container anchor: widget.
	widget topMostParent addChild: container.
	widget
		addEventHandler: extentChangedEventHandler;
		addEventHandler: positionInSpaceChangedEventHandler.
	container topMostParent
		addEventFilter: clickOutsideEventHandler;
		addEventFilter: pressEscEventHandler.
	container
		enqueueTask: watchDog;
		addEventHandler: extentChangedEventHandler.
	self relocate
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
	self visible
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
		ifTrue: [ self visible
				ifFalse: [ self show ] ]
		ifFalse: [ self visible
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
