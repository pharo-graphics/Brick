Class {
	#name : #BrWithContextMenuLook,
	#superclass : #BrWithAnchoredLook,
	#instVars : [
		'position',
		'mouseButton',
		'modifiersMatcher'
	],
	#category : #'Brick-Context Menu - Look'
}

{ #category : #'instance creation' }
BrWithContextMenuLook class >> anchoredLook [
	^ self anchoredLookClass new
]

{ #category : #accessing }
BrWithContextMenuLook class >> anchoredLookClass [
	^ BrContextMenuLook
]

{ #category : #accessing }
BrWithContextMenuLook class >> content: anObject [
	^ self stencil: [
		BrAnchoredElement new
			look: (self anchoredLook
				content: anObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #'instance creation' }
BrWithContextMenuLook class >> handle: anObject content: anotherObject [
	^ self stencil: [
		BrAnchoredElement new
			look: (self anchoredLook
				handle: anObject asStencil asElement;
				content: anotherObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #initialization }
BrWithContextMenuLook >> initialize [
	super initialize.
	
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
				apply: [ innerContainer look
						remove: BrContextMenuBottomLeftLook;
						remove: BrContextMenuTopRightLook;
						remove: BrContextMenuTopLeftLook;
						add: BrContextMenuBottomRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: [ position + (4 @ 4 negated) ];
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrContextMenuBottomRightLook;
						remove: BrContextMenuTopRightLook;
						remove: BrContextMenuTopLeftLook;
						add: BrContextMenuBottomLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: [ position + (4 negated @ 4) ];
				availableBounds: BrAnchoredTopRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrContextMenuBottomRightLook;
						remove: BrContextMenuBottomLeftLook;
						remove: BrContextMenuTopLeftLook;
						add: BrContextMenuTopRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: [ position + (4 @ 4) ];
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrContextMenuBottomRightLook;
						remove: BrContextMenuBottomLeftLook;
						remove: BrContextMenuTopRightLook;
						add: BrContextMenuTopLeftLook ] ];
		build.
]

{ #category : #initialization }
BrWithContextMenuLook >> initializeListeners [
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
BrWithContextMenuLook >> initializeRequests [
	super initializeRequests.

	self request: BrContextMenuStencilRequest new.
	self request: BrContextMenuVisibleRequest new
]

{ #category : #'api - context menu' }
BrWithContextMenuLook >> modifiersMatcher: aBlockOrSymbol [
	"Customize the modifiers matcher in a form of [ :aBlKeyModifiers | true ] that is used
	to test whether the context menu should be opened"

	modifiersMatcher := aBlockOrSymbol
]

{ #category : #'event handling' }
BrWithContextMenuLook >> onMouseUp: anEvent [
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
BrWithContextMenuLook >> usePrimaryMouseButton [
	mouseButton := BlMouseButton primary
]

{ #category : #'api - context menu' }
BrWithContextMenuLook >> useSecondaryMouseButton [
	mouseButton := BlMouseButton secondary
]
