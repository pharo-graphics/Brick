Class {
	#name : #BrWithDropdownLook2,
	#superclass : #BrWithAnchoredLook2,
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

{ #category : #'api - displaying' }
BrWithDropdownLook2 >> hide [
	super hide.
	widget visibility: BlVisibility visible
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
]

{ #category : #initialization }
BrWithDropdownLook2 >> initializeListeners [
	super initializeListeners.

	self
		when: BrDropdownStencilChanged
		do: [ :anEvent | self stencil: anEvent stencil ].

	self
		when: BrDropdownVisibleChanged
		do: [ :anEvent | self visible: anEvent visible ].

	self
		when: BrDropdownRelocateWish
		do: [ :aWish | self onRelocateWish: aWish ].
		
	self
		when: BrDropdownShowWish
		do: [ :aWish | self onShowWish: aWish ].
		
	self
		when: BrDropdownHideWish
		do: [ :aWish | self onHideWish: aWish ].
	
	self
		when: BlClickEvent
		do: [ self show ]
]

{ #category : #initialization }
BrWithDropdownLook2 >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownStencilRequest new.
	self request: BrDropdownVisibleRequest new
]

{ #category : #'api - displaying' }
BrWithDropdownLook2 >> show [
	super show.
	widget visibility: BlVisibility hidden
]
