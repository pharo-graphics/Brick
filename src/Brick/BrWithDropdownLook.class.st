Class {
	#name : #BrWithDropdownLook,
	#superclass : #BrWithAnchoredLook,
	#instVars : [
		'hideWishHandler',
		'clickShowCondition',
		'shouldHideWidget'
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
BrWithDropdownLook >> attachToCenter [
	strategy := BrAnchoredCompositeStrategy builder
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredBottomRightAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomLeftLook;
						removeLook: BrDropdownTopLeftLook;
						removeLook: BrDropdownTopRightLook;
						addLook: BrDropdownBottomRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightLook;
						removeLook: BrDropdownTopLeftLook;
						removeLook: BrDropdownTopRightLook;
						addLook: BrDropdownBottomLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredTopRightAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightLook;
						removeLook: BrDropdownBottomLeftLook;
						removeLook: BrDropdownTopRightLook;
						addLook: BrDropdownTopLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightLook;
						removeLook: BrDropdownBottomLeftLook;
						removeLook: BrDropdownTopLeftLook;
						addLook: BrDropdownTopRightLook ] ];
		build.
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> doNotHideWidget [
	self shouldHideWidget: false
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> hide [
	super hide.

	self shouldHideWidget
		ifTrue: [ self widgetDo: [ :aWidget | aWidget visibility: BlVisibility visible ] ]
]

{ #category : #initialization }
BrWithDropdownLook >> initialize [
	super initialize.
	
	hideWishHandler := BlEventHandler
		on: BrDropdownHideWish
		do: [ :aWish | self onHideWish: aWish ].

	clickShowCondition := [ :aClickEvent | true ].
	
	"when true, the widget under the dropdown will be hidden"
	shouldHideWidget := true.

	preferredExtent := 200 @ 300.
	strategy := BrAnchoredCompositeStrategy builder
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopLeftReferencePoint;
				availableBounds: BrAnchoredBottomRightAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomLeftLook;
						removeLook: BrDropdownTopLeftLook;
						removeLook: BrDropdownTopRightLook;
						addLook: BrDropdownBottomRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopRightReferencePoint;
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightLook;
						removeLook: BrDropdownTopLeftLook;
						removeLook: BrDropdownTopRightLook;
						addLook: BrDropdownBottomLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomLeftReferencePoint;
				availableBounds: BrAnchoredTopRightAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightLook;
						removeLook: BrDropdownBottomLeftLook;
						removeLook: BrDropdownTopRightLook;
						addLook: BrDropdownTopLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomRightReferencePoint;
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightLook;
						removeLook: BrDropdownBottomLeftLook;
						removeLook: BrDropdownTopLeftLook;
						addLook: BrDropdownTopRightLook ] ];
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
		do: [ :anEvent |
			((self shouldShowDueToClick: anEvent)
				and: [ self isWidgetEnabled ])
					ifTrue: [
						anEvent consumed: true.
						self show ] ]
]

{ #category : #initialization }
BrWithDropdownLook >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownStencilRequest new.
	self request: BrDropdownVisibleRequest new
]

{ #category : #'private - testing' }
BrWithDropdownLook >> isWidgetEnabled [	
	self widgetDo: [ :aWidget | ^ (aWidget states hasState: BlElementState disabled) not ].
	^ true
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
BrWithDropdownLook >> onControlClick [
	clickShowCondition := [ :anEvent | anEvent modifiers isCtrl ]
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> onPrimaryClick [
	clickShowCondition := [ :anEvent | anEvent modifiers isPrimaryModifier ]
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> shouldHideWidget [
	^ shouldHideWidget
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> shouldHideWidget: anObject [
	shouldHideWidget := anObject
]

{ #category : #'private - testing' }
BrWithDropdownLook >> shouldShowDueToClick: aClickEvent [
	^ clickShowCondition value: aClickEvent
]

{ #category : #'api - displaying' }
BrWithDropdownLook >> show [
	super show.

	self shouldHideWidget
		ifTrue: [ self widgetDo: [ :aWidget | aWidget visibility: BlVisibility hidden ] ]
]
