Class {
	#name : #BrWithContextMenuAptitude,
	#superclass : #BrWithAnchoredAptitude,
	#instVars : [
		'position',
		'mouseButton',
		'modifiersMatcher',
		'hideWishHandler'
	],
	#category : #'Brick-Context Menu - Look'
}

{ #category : #'instance creation' }
BrWithContextMenuAptitude class >> anchoredAptitude [
	^ self anchoredAptitudeClass new
]

{ #category : #accessing }
BrWithContextMenuAptitude class >> anchoredAptitudeClass [
	^ BrContextMenuAptitude
]

{ #category : #accessing }
BrWithContextMenuAptitude class >> content: anObject [
	^ self stencil: [
		BrAnchoredElement new
			aptitude: (self anchoredAptitude
				content: anObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #'instance creation' }
BrWithContextMenuAptitude class >> handle: anObject content: anotherObject [
	^ self stencil: [
		BrAnchoredElement new
			aptitude: (self anchoredAptitude
				handle: anObject asStencil asElement;
				content: anotherObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #initialization }
BrWithContextMenuAptitude >> initialize [
	super initialize.
	
	hideWishHandler := BlEventHandler
		on: BrContextMenuHideWish
		do: [ :aWish | self onHideWish: aWish ].
	
	preferredExtent := 200 @ 400.
	
	mouseButton := BlMouseButton secondary.
	modifiersMatcher := [ :aBlKeyModifiers | true ].
	
	strategy := BrAnchoredCompositeStrategy builder
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: [ position + (4 negated @ 4 negated) ];
				availableBounds: BrAnchoredBottomRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrContextMenuBottomLeftAptitude;
						remove: BrContextMenuTopRightAptitude;
						remove: BrContextMenuTopLeftAptitude;
						add: BrContextMenuBottomRightAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: [ position + (4 @ 4 negated) ];
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrContextMenuBottomRightAptitude;
						remove: BrContextMenuTopRightAptitude;
						remove: BrContextMenuTopLeftAptitude;
						add: BrContextMenuBottomLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: [ position + (4 negated @ 4) ];
				availableBounds: BrAnchoredTopRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrContextMenuBottomRightAptitude;
						remove: BrContextMenuBottomLeftAptitude;
						remove: BrContextMenuTopLeftAptitude;
						add: BrContextMenuTopRightAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: [ position + (4 @ 4) ];
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrContextMenuBottomRightAptitude;
						remove: BrContextMenuBottomLeftAptitude;
						remove: BrContextMenuTopRightAptitude;
						add: BrContextMenuTopLeftAptitude ] ];
		build.
]

{ #category : #initialization }
BrWithContextMenuAptitude >> initializeListeners [
	super initializeListeners.

	self
		when: BrContextMenuStencilChanged
		do: [ :anEvent | self stencil: anEvent stencil ].

	self
		when: BrContextMenuVisibleChanged
		do: [ :anEvent | self visible: anEvent visible ].

	self
		when: BrContextMenuRelocateWish
		do: [ :aWish | self onRelocateWish: aWish ].
		
	self
		when: BrContextMenuShowWish
		do: [ :aWish | self onShowWish: aWish ].
		
	self
		when: BrContextMenuHideWish
		do: [ :aWish | self onHideWish: aWish ].

	self
		when: BlMouseUpEvent
		do: [ :anEvent |  self onMouseUp: anEvent ]
]

{ #category : #initialization }
BrWithContextMenuAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrContextMenuStencilRequest new.
	self request: BrContextMenuVisibleRequest new
]

{ #category : #'api - context menu' }
BrWithContextMenuAptitude >> modifiersMatcher: aBlockOrSymbol [
	"Customize the modifiers matcher in a form of [ :aBlKeyModifiers | true ] that is used
	to test whether the context menu should be opened"

	modifiersMatcher := aBlockOrSymbol
]

{ #category : #'private - hooks' }
BrWithContextMenuAptitude >> onAnchoredElementCreated: anAnchoredElement [
	anAnchoredElement addEventHandler: hideWishHandler
]

{ #category : #'private - hooks' }
BrWithContextMenuAptitude >> onAnchoredElementRemoved: anAnchoredElement [
	anAnchoredElement removeEventHandler: hideWishHandler
]

{ #category : #'event handling' }
BrWithContextMenuAptitude >> onMouseUp: anEvent [
	anEvent button = mouseButton
		ifFalse: [ ^ self ].
	
	(modifiersMatcher value: anEvent modifiers)
		ifFalse: [ ^ self ].

	anEvent consumed: true.

	self canHide
		ifTrue: [ self hide ].

	position := self root globalPointToLocal: anEvent position.
	self show
]

{ #category : #'api - context menu' }
BrWithContextMenuAptitude >> usePrimaryMouseButton [
	mouseButton := BlMouseButton primary
]

{ #category : #'api - context menu' }
BrWithContextMenuAptitude >> useSecondaryMouseButton [
	mouseButton := BlMouseButton secondary
]
