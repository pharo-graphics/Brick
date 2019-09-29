Class {
	#name : #BrWithContextMenuLook,
	#superclass : #BrLook,
	#instVars : [
		'container',
		'stencil',
		'position',
		'watchDog',
		'clickEventHandler',
		'clickOutsideEventHandler',
		'pressEscEventHandler',
		'extentChangedEventHandler',
		'positionInSpaceChangedEventHandler',
		'hideEventHandler'
	],
	#category : #'Brick-Context Menu - Look'
}

{ #category : #accessing }
BrWithContextMenuLook >> hide [
	self assert: [ self visible ].
	widget
		removeEventHandler: extentChangedEventHandler;
		removeEventHandler: positionInSpaceChangedEventHandler.
	container topMostParent
		removeEventFilter: clickOutsideEventHandler;
		removeEventHandler: pressEscEventHandler.
	container
		dequeueTask: watchDog;
		removeEventHandler: extentChangedEventHandler;
		removeFromParent.
	container := nil
]

{ #category : #initialization }
BrWithContextMenuLook >> initialize [
	super initialize.
	position := 0 @ 0.
	watchDog := BlRepeatedTaskAction new
		delay: 500 milliSeconds;
		action: [ (self visible
				and: [ widget isNil or: [ widget isAttachedToSceneGraph not ] ])
				ifTrue: [ self hide ] ];
		yourself.
	clickEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			e button = BlMouseButton secondary
				ifTrue: [ self visible
						ifTrue: [ self hide ].
					position := e localPosition.
					self show ] ].
	clickOutsideEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			(self visible
				and: [ e target ~~ container and: [ (e target hasParent: container) not ] ])
				ifTrue: [ self hide ] ].
	pressEscEventHandler := BlEventHandler
		on: BlKeyUpEvent
		do: [ :e | 
			e key = BlKeyboardKey escape
				ifTrue: [ self visible
						ifTrue: [ self hide ] ] ].
	extentChangedEventHandler := BlEventHandler
		on: BlElementExtentChangedEvent
		do: [ self visible
				ifTrue: [ self relocate ] ].
	positionInSpaceChangedEventHandler := BlEventHandler
		on: BlElementPositionInSpaceChangedEvent
		do: [ self visible
				ifTrue: [ self relocate ] ].
	hideEventHandler := BlEventHandler
		on: BrContextMenuHideWish
		do: [ :e | 
			self
				widgetDo: [ (e anchor = widget and: [ self visible ])
						ifTrue: [ self hide ] ] ].
	self stencil: [ BlElement new ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					widget
						addEventHandler: clickEventHandler;
						addEventHandler: hideEventHandler ];
				down: [ :e | 
					self visible
						ifTrue: [ self hide ].
					widget
						removeEventHandler: clickEventHandler;
						removeEventHandler: hideEventHandler ];
				yourself)
]

{ #category : #initialization }
BrWithContextMenuLook >> initializeListeners [
	super initializeListeners.
	self
		when: BrContextMenuStencilChanged
		do: [ :e | self stencil: e stencil ].
	self
		when: BrContextMenuVisibleChanged
		do: [ :e | self visible: e visible ]
]

{ #category : #initialization }
BrWithContextMenuLook >> initializeRequests [
	super initializeRequests.
	self request: BrContextMenuStencilRequest new.
	self request: BrContextMenuVisibleRequest new
]

{ #category : #'host space - displaying' }
BrWithContextMenuLook >> relocate [
	self assert: [ self visible ].
	container
		dispatchEvent: (BrContextMenuRelocateWish position: position anchor: widget container: container)
]

{ #category : #'host space - displaying' }
BrWithContextMenuLook >> show [
	self assert: [ self visible not ].
	container := stencil asElement.
	widget topMostParent addChild: container.
	widget
		addEventHandler: extentChangedEventHandler;
		addEventHandler: positionInSpaceChangedEventHandler.
	container topMostParent
		addEventFilter: clickOutsideEventHandler;
		addEventHandler: pressEscEventHandler.
	container
		enqueueTask: watchDog;
		addEventHandler: extentChangedEventHandler.
	self relocate
]

{ #category : #accessing }
BrWithContextMenuLook >> stencil [
	^ stencil
]

{ #category : #accessing }
BrWithContextMenuLook >> stencil: aBrStencil [
	stencil := aBrStencil asStencil.
	self visible
		ifTrue: [ self
				hide;
				show ]
]

{ #category : #accessing }
BrWithContextMenuLook >> visible [
	^ container ifNil: [ false ] ifNotNil: #isAttachedToSceneGraph
]

{ #category : #accessing }
BrWithContextMenuLook >> visible: aBoolean [
	aBoolean
		ifTrue: [ self visible
				ifFalse: [ self show ] ]
		ifFalse: [ self visible
				ifTrue: [ self hide ] ]
]
