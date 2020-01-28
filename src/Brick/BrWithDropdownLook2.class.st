Class {
	#name : #BrWithDropdownLook2,
	#superclass : #BrWithAnchoredLook2,
	#instVars : [
		'clickEventHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 class >> anchoredLook [
	^ self anchoredLookClass new
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 class >> anchoredLookClass [
	^ BrDropdownLook2
]

{ #category : #accessing }
BrWithDropdownLook2 class >> content: anObject [
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
BrWithDropdownLook2 class >> handle: anObject content: anotherObject [
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

{ #category : #'host space - displaying' }
BrWithDropdownLook2 >> hide [
	super hide.
	widget visibility: BlVisibility visible
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 >> hideWishClass [
	^ BrDropdownHideWish
]

{ #category : #initialization }
BrWithDropdownLook2 >> initialize [
	super initialize.
	preferredExtent := 200 @ 300.
	strategy := BrAnchoredCompositeStrategy builder
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopLeftReferencePoint;
				availableBounds: BrAnchoredBottomRightAvailableBounds;
				apply: [ innerContainer look
						remove: BrDropdownBottomLeftLook;
						remove: BrDropdownTopLeftLook;
						remove: BrDropdownTopRightLook;
						add: BrDropdownBottomRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopRightReferencePoint;
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				apply: [ innerContainer look
						remove: BrDropdownBottomRightLook;
						remove: BrDropdownTopLeftLook;
						remove: BrDropdownTopRightLook;
						add: BrDropdownBottomLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomLeftReferencePoint;
				availableBounds: BrAnchoredTopRightAvailableBounds;
				apply: [ innerContainer look
						remove: BrDropdownBottomRightLook;
						remove: BrDropdownBottomLeftLook;
						remove: BrDropdownTopLeftLook;
						add: BrDropdownTopRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomRightReferencePoint;
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				apply: [ innerContainer look
						remove: BrDropdownBottomRightLook;
						remove: BrDropdownBottomLeftLook;
						remove: BrDropdownTopRightLook;
						add: BrDropdownTopLeftLook ] ];
		build.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ :e | self show ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventFilter: clickEventHandler ];
				down: [ :e | widget removeEventFilter: clickEventHandler ];
				yourself)
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 >> relocateWishClass [
	^ BrDropdownRelocateWish
]

{ #category : #'host space - displaying' }
BrWithDropdownLook2 >> show [
	super show.
	widget visibility: BlVisibility hidden
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 >> showWishClass [
	^ BrDropdownShowWish
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 >> stencilChangedClass [
	^ BrDropdownStencilChanged
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 >> stencilRequest [
	^ BrDropdownStencilRequest new
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 >> visibleChangedClass [
	^ BrDropdownVisibleChanged
]

{ #category : #'as yet unclassified' }
BrWithDropdownLook2 >> visibleRequest [
	^ BrDropdownVisibleRequest new
]
