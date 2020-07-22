Class {
	#name : #BrWithAnchoredLook2,
	#superclass : #BrLook,
	#instVars : [
		'root',
		'outerContainer',
		'innerContainer',
		'stencil',
		'strategy',
		'preferredExtent',
		'watchDog',
		'clickOutsideEventHandler',
		'pressEscEventHandler',
		'extentChangedEventHandler',
		'positionInSpaceChangedEventHandler',
		'hideEventHandler',
		'showEventHandler',
		'relocateEventHandler'
	],
	#category : #'Brick-Anchored - Look'
}

{ #category : #accessing }
BrWithAnchoredLook2 class >> stencil: anObject [
	^ self new
		stencil: anObject;
		yourself
]

{ #category : #testing }
BrWithAnchoredLook2 >> canHide [
	^ self visible
]

{ #category : #testing }
BrWithAnchoredLook2 >> canRelocate [
	^ widget isNotNil
		and: [ widget isAttachedToSceneGraph
				and: [ outerContainer isNotNil
						and: [ outerContainer isAttachedToSceneGraph ] ] ]
]

{ #category : #testing }
BrWithAnchoredLook2 >> canShow [
	^ self visible not
		and: [ widget isNotNil
				and:
					[ widget isAttachedToSceneGraph and: [ widget visibility shouldDraw ] ] ]
]

{ #category : #accessing }
BrWithAnchoredLook2 >> hide [
	self assert: [ self canHide ].
	widget
		removeEventHandler: extentChangedEventHandler;
		removeEventHandler: positionInSpaceChangedEventHandler.
	self root
		removeChild: outerContainer;
		removeEventFilter: clickOutsideEventHandler;
		removeEventFilter: pressEscEventHandler.
	outerContainer := nil.
	self
		flag: 'TODO extentChangedEventHandler really needed on inner container?'.
	innerContainer
		dequeueTask: watchDog;
		removeEventHandler: extentChangedEventHandler.
	innerContainer := nil
]

{ #category : #initialization }
BrWithAnchoredLook2 >> initialize [
	super initialize.
	self stencil: [ BlElement new ].
	watchDog := BlRepeatedTaskAction new
		delay: 500 milliSeconds;
		action: [ "hide when widget removed from scene by checking repeatedly"
			(widget isAttachedToSceneGraph not and: [ self canHide ])
				ifTrue: [ self hide ] ];
		yourself.
	clickOutsideEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			"hide when clicked outside of container"
			((e target ~~ innerContainer
				and: [ (e target hasParent: innerContainer) not ])
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

	self
		addChange:
			(BrLookChange new
				up: [ :e |  ];
				down: [ :e | 
					self canHide
						ifTrue: [ self hide ] ];
				yourself)
]

{ #category : #'private - event handling' }
BrWithAnchoredLook2 >> onHideWish: aWish [
	"hide on wish"
	
	(aWish anchor = widget and: [ self canHide ])
		ifTrue: [ self hide ]
]

{ #category : #'private - event handling' }
BrWithAnchoredLook2 >> onRelocateWish: aWish [
	(aWish anchor = widget and: [ self canRelocate ])
		ifTrue: [ self relocate: aWish ]
]

{ #category : #'private - event handling' }
BrWithAnchoredLook2 >> onShowWish: aWish [
	(aWish anchor = widget and: [ self canShow ])
		ifTrue: [ self show ]
]

{ #category : #accessing }
BrWithAnchoredLook2 >> preferredExtent [
	^ preferredExtent
]

{ #category : #accessing }
BrWithAnchoredLook2 >> preferredExtent: anObject [
	preferredExtent = anObject
		ifTrue: [ ^ self ].
	preferredExtent := anObject.
	self canRelocate
		ifTrue: [ self canRelocate ]
]

{ #category : #'host space - displaying' }
BrWithAnchoredLook2 >> relocate [
	self relocate: nil
]

{ #category : #'host space - displaying' }
BrWithAnchoredLook2 >> relocate: aRelocateEvent [
	self assert: [ self canRelocate ].
	strategy
		invalidate: outerContainer
		forPreferredExtent: preferredExtent
]

{ #category : #accessing }
BrWithAnchoredLook2 >> root [
	^ root ifNil: [ root := widget topMostParent ]
]

{ #category : #accessing }
BrWithAnchoredLook2 >> root: anElement [
	| shouldHide |
	self flag: 'TODO root should be part of model'.
	shouldHide := self canHide.
	shouldHide
		ifTrue: [ self hide ].
	root := anElement.
	shouldHide
		ifTrue: [ self show ]
]

{ #category : #'host space - displaying' }
BrWithAnchoredLook2 >> show [
	self assert: [ self canShow ].
	self flag: 'TODO extentChangedEventHandler really needed on inner container?'.
	innerContainer := stencil asElement
		enqueueTask: watchDog;
		addEventHandler: extentChangedEventHandler;
		yourself.
	
	self flag: 'TODO get rid of having to set anchor'.
	innerContainer anchor: widget.	
	
	outerContainer := BrAnchoredOuterContainer new
		addChild: innerContainer;
		yourself.
	self root
		addChild: outerContainer;
		addEventFilter: clickOutsideEventHandler;
		addEventFilter: pressEscEventHandler.
	widget
		addEventHandler: extentChangedEventHandler;
		addEventHandler: positionInSpaceChangedEventHandler.
	self relocate
]

{ #category : #accessing }
BrWithAnchoredLook2 >> stencil [
	^ stencil
]

{ #category : #accessing }
BrWithAnchoredLook2 >> stencil: anObject [
	stencil = anObject
		ifTrue: [ ^ self ].
	stencil := anObject asStencil.
	self canHide
		ifTrue: [ self
				hide;
				show ]
]

{ #category : #accessing }
BrWithAnchoredLook2 >> strategy [
	^ strategy
]

{ #category : #accessing }
BrWithAnchoredLook2 >> strategy: anObject [
	strategy = anObject
		ifTrue: [ ^ self ].
	strategy := anObject.
	self canRelocate
		ifTrue: [ self canRelocate ]
]

{ #category : #accessing }
BrWithAnchoredLook2 >> visible [
	^ innerContainer ifNil: [ false ] ifNotNil: #isAttachedToSceneGraph
]

{ #category : #accessing }
BrWithAnchoredLook2 >> visible: aBoolean [
	aBoolean
		ifTrue: [ self canShow
				ifTrue: [ self show ] ]
		ifFalse: [ self canHide
				ifTrue: [ self hide ] ]
]
