Class {
	#name : #BrWithDropdownLook,
	#superclass : #BrWithAnchoredLook,
	#instVars : [
		'hideWishHandler'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #accessing }
BrWithDropdownLook class >> anchoredLook [
	^ self anchoredLookClass new
]

{ #category : #accessing }
BrWithDropdownLook class >> anchoredLookClass [
	^ BrDropdownLook
]

{ #category : #accessing }
BrWithDropdownLook class >> content: anObject [
	^ self stencil: [
		BrAnchoredElement new
			look: (self anchoredLook
				content: anObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #'instance creation' }
BrWithDropdownLook class >> handle: anObject content: anotherObject [
	^ self
		handle: anObject
		content: anotherObject
		lookDo: [ :anAnchoredLook | ]
]

{ #category : #'instance creation' }
BrWithDropdownLook class >> handle: anObject content: anotherObject lookDo: aBlock [
	^ self
		stencil: [
			| anAnchoredLook |
			
			anAnchoredLook := self anchoredLook
				handle: anObject asStencil asElement;
				content: anotherObject asStencil asElement;
				yourself.

			aBlock value: anAnchoredLook.
			
			BrAnchoredElement new
				look: anAnchoredLook;
				yourself ]
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> hide [
	super hide.

	self widgetDo: [ :aWidget | aWidget visibility: BlVisibility visible ]
]

{ #category : #initialization }
BrWithDropdownLook >> initialize [
	super initialize.
	
	hideWishHandler := BlEventHandler
		on: BrDropdownHideWish
		do: [ :aWish | self onHideWish: aWish ].
	
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
BrWithDropdownLook >> initializeListeners [
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
BrWithDropdownLook >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownStencilRequest new.
	self request: BrDropdownVisibleRequest new
]

{ #category : #'private - hooks' }
BrWithDropdownLook >> onAnchoredElementCreated: anAnchoredElement [
	anAnchoredElement addEventHandler: hideWishHandler
]

{ #category : #'private - hooks' }
BrWithDropdownLook >> onAnchoredElementRemoved: anAnchoredElement [
	anAnchoredElement removeEventHandler: hideWishHandler
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> show [
	super show.

	self widgetDo: [ :aWidget | aWidget visibility: BlVisibility hidden ]
]
