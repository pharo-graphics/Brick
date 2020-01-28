Class {
	#name : #BrWithContextMenuLook2,
	#superclass : #BrWithAnchoredLook2,
	#instVars : [
		'position',
		'clickEventHandler',
		'mouseButton'
	],
	#category : #'Brick-Context Menu - Look'
}

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 class >> anchoredLook [
	^ self anchoredLookClass new
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 class >> anchoredLookClass [
	^ BrContextMenuLook2
]

{ #category : #accessing }
BrWithContextMenuLook2 class >> content: anObject [
	| instance |
	^ instance := self
		stencil: [ BlElement new
				look:
					(self anchoredLook
						withAnchoredLook: instance;
						content: anObject asStencil asElement;
						yourself);
				yourself ]
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 class >> handle: anObject content: anotherObject [
	| instance |
	^ instance := self
		stencil: [ BlElement new
				look:
					(self anchoredLook
						withAnchoredLook: instance;
						handle: anObject asStencil asElement;
						content: anotherObject asStencil asElement;
						yourself);
				yourself ]
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> hideWishClass [
	^ BrContextMenuHideWish
]

{ #category : #initialization }
BrWithContextMenuLook2 >> initialize [
	super initialize.
	preferredExtent := 200 @ 400.
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
	mouseButton := BlMouseButton secondary.
	clickEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			e button = mouseButton
				ifTrue: [ self canHide
						ifTrue: [ self hide ].
					position := self root globalPointToLocal: e position.
					self show ] ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventHandler: clickEventHandler ];
				down: [ :e | widget removeEventHandler: clickEventHandler ];
				yourself)
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> relocateWishClass [
	^ BrContextMenuRelocateWish
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> showWishClass [
	^ BrContextMenuShowWish
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> stencilChangedClass [
	^ BrContextMenuStencilChanged
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> stencilRequest [
	^ BrContextMenuStencilRequest new
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> usePrimaryMouseButton [
	mouseButton := BlMouseButton primary
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> visibleChangedClass [
	^ BrContextMenuVisibleChanged
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook2 >> visibleRequest [
	^ BrContextMenuVisibleRequest new
]
