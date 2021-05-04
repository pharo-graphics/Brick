Class {
	#name : #BrWithDropdownAptitude,
	#superclass : #BrWithAnchoredAptitude,
	#instVars : [
		'hideWishHandler',
		'clickShowCondition',
		'shouldHideWidget'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #accessing }
BrWithDropdownAptitude class >> anchoredLook [
	^ self anchoredLookClass new
]

{ #category : #accessing }
BrWithDropdownAptitude class >> anchoredLookClass [
	^ BrDropdownAptitude
]

{ #category : #accessing }
BrWithDropdownAptitude class >> content: anObject [
	^ self stencil: [
		BrAnchoredElement new
			aptitude: (self anchoredLook
				content: anObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #'instance creation' }
BrWithDropdownAptitude class >> handle: anObject content: anotherObject [
	^ self
		handle: anObject
		content: anotherObject
		lookDo: [ :anAnchoredLook | ]
]

{ #category : #'instance creation' }
BrWithDropdownAptitude class >> handle: anObject content: anotherObject lookDo: aBlock [
	^ self
		stencil: [
			| anAnchoredLook |
			
			anAnchoredLook := self anchoredLook
				handle: anObject asStencil asElement;
				content: anotherObject asStencil asElement;
				yourself.

			aBlock value: anAnchoredLook.
			
			BrAnchoredElement new
				aptitude: anAnchoredLook;
				yourself ]
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> attachToCenter [
	strategy := BrAnchoredCompositeStrategy builder
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredBottomRightAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomLeftAptitude;
						removeLook: BrDropdownTopLeftAptitude;
						removeLook: BrDropdownTopRightAptitude;
						addAptitude: BrDropdownBottomRightAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightAptitude;
						removeLook: BrDropdownTopLeftAptitude;
						removeLook: BrDropdownTopRightAptitude;
						addAptitude: BrDropdownBottomLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredTopRightAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightAptitude;
						removeLook: BrDropdownBottomLeftAptitude;
						removeLook: BrDropdownTopRightAptitude;
						addAptitude: BrDropdownTopLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterReferencePoint;
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightAptitude;
						removeLook: BrDropdownBottomLeftAptitude;
						removeLook: BrDropdownTopLeftAptitude;
						addAptitude: BrDropdownTopRightAptitude ] ];
		build.
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> doNotHideWidget [
	self shouldHideWidget: false
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> hide [
	super hide.

	self shouldHideWidget
		ifTrue: [ self widgetDo: [ :aWidget | aWidget visibility: BlVisibility visible ] ]
]

{ #category : #initialization }
BrWithDropdownAptitude >> initialize [
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
						removeLook: BrDropdownBottomLeftAptitude;
						removeLook: BrDropdownTopLeftAptitude;
						removeLook: BrDropdownTopRightAptitude;
						addAptitude: BrDropdownBottomRightAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopRightReferencePoint;
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightAptitude;
						removeLook: BrDropdownTopLeftAptitude;
						removeLook: BrDropdownTopRightAptitude;
						addAptitude: BrDropdownBottomLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomLeftReferencePoint;
				availableBounds: BrAnchoredTopRightAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightAptitude;
						removeLook: BrDropdownBottomLeftAptitude;
						removeLook: BrDropdownTopRightAptitude;
						addAptitude: BrDropdownTopLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomRightReferencePoint;
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				apply: [ innerContainer
						removeLook: BrDropdownBottomRightAptitude;
						removeLook: BrDropdownBottomLeftAptitude;
						removeLook: BrDropdownTopLeftAptitude;
						addAptitude: BrDropdownTopRightAptitude ] ];
		build.
]

{ #category : #initialization }
BrWithDropdownAptitude >> initializeListeners [
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
BrWithDropdownAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownStencilRequest new.
	self request: BrDropdownVisibleRequest new
]

{ #category : #'private - testing' }
BrWithDropdownAptitude >> isWidgetEnabled [	
	self widgetDo: [ :aWidget | ^ (aWidget states hasState: BlElementState disabled) not ].
	^ true
]

{ #category : #'private - hooks' }
BrWithDropdownAptitude >> onAnchoredElementCreated: anAnchoredElement [
	anAnchoredElement addEventHandler: hideWishHandler
]

{ #category : #'private - hooks' }
BrWithDropdownAptitude >> onAnchoredElementRemoved: anAnchoredElement [
	anAnchoredElement removeEventHandler: hideWishHandler
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> onControlClick [
	clickShowCondition := [ :anEvent | anEvent modifiers isCtrl ]
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> onPrimaryClick [
	clickShowCondition := [ :anEvent | anEvent modifiers isPrimaryModifier ]
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> shouldHideWidget [
	^ shouldHideWidget
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> shouldHideWidget: anObject [
	shouldHideWidget := anObject
]

{ #category : #'private - testing' }
BrWithDropdownAptitude >> shouldShowDueToClick: aClickEvent [
	^ clickShowCondition value: aClickEvent
]

{ #category : #'api - displaying' }
BrWithDropdownAptitude >> show [
	super show.

	self shouldHideWidget
		ifTrue: [ self widgetDo: [ :aWidget | aWidget visibility: BlVisibility hidden ] ]
]
