Class {
	#name : #BrWithTooltipAptitude,
	#superclass : #BrWithAnchoredAptitude,
	#instVars : [
		'clickEventHandler',
		'overEventHandler',
		'outEventHandler',
		'hideLaterTask',
		'showLaterTask',
		'showDelay',
		'hideDelay'
	],
	#category : #'Brick-Tooltip - Look'
}

{ #category : #'instance creation' }
BrWithTooltipAptitude class >> anchoredAptitude [
	^ self anchoredAptitudeClass new
]

{ #category : #accessing }
BrWithTooltipAptitude class >> anchoredAptitudeClass [
	^ BrTooltipAptitude
]

{ #category : #'instance creation' }
BrWithTooltipAptitude class >> content: anObject [
	^ self stencil: [
		BrAnchoredElement new
			aptitude: (self anchoredAptitude
				content: anObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #'instance creation' }
BrWithTooltipAptitude class >> handle: anObject content: anotherObject [
	^ self stencil: [
		BrAnchoredElement new
			aptitude: (self anchoredAptitude
				handle: anObject asStencil asElement;
				content: anotherObject asStencil asElement;
				yourself);
			yourself ]
]

{ #category : #accessing }
BrWithTooltipAptitude >> cancelHideLater [
	hideLaterTask ifNotNil: [ :aTask | aTask stop ].
	hideLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipAptitude >> cancelShowLater [
	showLaterTask ifNotNil: [ :aTask | aTask stop ].
	showLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipAptitude >> contentStencil: aStencil [
	self stencil: [ 
		BrAnchoredElement new
			aptitude: (self class anchoredAptitude content: aStencil asStencil asElement) ]
]

{ #category : #accessing }
BrWithTooltipAptitude >> hide [
	super hide.
	self willShowLater
		ifTrue: [ self cancelShowLater ].
	self willHideLater
		ifTrue: [ self cancelHideLater ]
]

{ #category : #accessing }
BrWithTooltipAptitude >> hideDelay [
	^ hideDelay
]

{ #category : #accessing }
BrWithTooltipAptitude >> hideDelay: anObject [
	hideDelay := anObject
]

{ #category : #accessing }
BrWithTooltipAptitude >> hideLater [
	self assert: [ self canHide ].
	self cancelHideLater.
	hideLaterTask := BlDelayedTaskAction new
		delay: self hideDelay;
		action: [ self canHide
				ifTrue: [ self hide ].
			hideLaterTask := nil ];
		yourself.
	innerContainer enqueueTask: hideLaterTask
]

{ #category : #initialization }
BrWithTooltipAptitude >> initialize [
	super initialize.
	preferredExtent := 200 @ 50.
	strategy := BrAnchoredCompositeStrategy builder
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomCenterReferencePoint;
				availableBounds: BrAnchoredBottomCenterAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipTopCenterAptitude;
						remove: BrTooltipCenterLeftAptitude;
						remove: BrTooltipCenterRightAptitude;
						remove: BrTooltipBottomLeftAptitude;
						remove: BrTooltipBottomRightAptitude;
						remove: BrTooltipTopLeftAptitude;
						remove: BrTooltipTopRightAptitude;
						add: BrTooltipBottomCenterAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopCenterReferencePoint;
				availableBounds: BrAnchoredTopCenterAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipBottomCenterAptitude;
						remove: BrTooltipCenterLeftAptitude;
						remove: BrTooltipCenterRightAptitude;
						remove: BrTooltipBottomLeftAptitude;
						remove: BrTooltipBottomRightAptitude;
						remove: BrTooltipTopLeftAptitude;
						remove: BrTooltipTopRightAptitude;
						add: BrTooltipTopCenterAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterRightReferencePoint;
				availableBounds: BrAnchoredCenterRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipBottomCenterAptitude;
						remove: BrTooltipTopCenterAptitude;
						remove: BrTooltipCenterLeftAptitude;
						remove: BrTooltipBottomLeftAptitude;
						remove: BrTooltipBottomRightAptitude;
						remove: BrTooltipTopLeftAptitude;
						remove: BrTooltipTopRightAptitude;
						add: BrTooltipCenterRightAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterLeftReferencePoint;
				availableBounds: BrAnchoredCenterLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipBottomCenterAptitude;
						remove: BrTooltipTopCenterAptitude;
						remove: BrTooltipCenterRightAptitude;
						remove: BrTooltipBottomLeftAptitude;
						remove: BrTooltipBottomRightAptitude;
						remove: BrTooltipTopLeftAptitude;
						remove: BrTooltipTopRightAptitude;
						add: BrTooltipCenterLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomLeftReferencePoint;
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipBottomCenterAptitude;
						remove: BrTooltipTopCenterAptitude;
						remove: BrTooltipCenterLeftAptitude;
						remove: BrTooltipCenterRightAptitude;
						remove: BrTooltipBottomRightAptitude;
						remove: BrTooltipTopLeftAptitude;
						remove: BrTooltipTopRightAptitude;
						add: BrTooltipBottomLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomRightReferencePoint;
				availableBounds: BrAnchoredBottomRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipBottomCenterAptitude;
						remove: BrTooltipTopCenterAptitude;
						remove: BrTooltipCenterLeftAptitude;
						remove: BrTooltipCenterRightAptitude;
						remove: BrTooltipBottomLeftAptitude;
						remove: BrTooltipTopLeftAptitude;
						remove: BrTooltipTopRightAptitude;
						add: BrTooltipBottomRightAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopLeftReferencePoint;
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipBottomCenterAptitude;
						remove: BrTooltipTopCenterAptitude;
						remove: BrTooltipCenterLeftAptitude;
						remove: BrTooltipCenterRightAptitude;
						remove: BrTooltipBottomLeftAptitude;
						remove: BrTooltipBottomRightAptitude;
						remove: BrTooltipTopRightAptitude;
						add: BrTooltipTopLeftAptitude ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopRightReferencePoint;
				availableBounds: BrAnchoredTopRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer aptitude
						remove: BrTooltipBottomCenterAptitude;
						remove: BrTooltipTopCenterAptitude;
						remove: BrTooltipCenterLeftAptitude;
						remove: BrTooltipCenterRightAptitude;
						remove: BrTooltipBottomLeftAptitude;
						remove: BrTooltipBottomRightAptitude;
						remove: BrTooltipTopLeftAptitude;
						add: BrTooltipTopRightAptitude ] ];
		build.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ self willHideLater
				ifTrue: [ self cancelHideLater ].
			self canHide
				ifTrue: [ self hide ] ].
	overEventHandler := BlEventHandler
		on: BlMouseEnterEvent
		do: [ :e | 
			self willHideLater
				ifTrue: [ self cancelHideLater ].
			self canShow
				ifTrue: [ self showLater ] ].
	outEventHandler := BlEventHandler
		on: BlMouseLeaveEvent
		do: [ :e | 
			self willShowLater
				ifTrue: [ self cancelShowLater ].
			self canHide
				ifTrue: [ self hideLater ] ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					widget
						addEventHandler: clickEventHandler;
						addEventHandler: overEventHandler;
						addEventHandler: outEventHandler ];
				down: [ :e | 
					widget
						removeEventHandler: clickEventHandler;
						removeEventHandler: overEventHandler;
						removeEventHandler: outEventHandler ];
				yourself);
		addChange:
			(BrLookChange new
				up: [ :e |  ];
				down: [ :e | 
					self willShowLater
						ifTrue: [ self cancelShowLater ].
					self willHideLater
						ifTrue: [ self cancelHideLater ] ];
				yourself).
	self showDelay: 1000 milliSeconds.
	self hideDelay: 300 milliSeconds
]

{ #category : #initialization }
BrWithTooltipAptitude >> initializeListeners [
	super initializeListeners.

	self
		when: BrTooltipStencilChanged
		do: [ :anEvent | self stencil: anEvent stencil ].

	self
		when: BrTooltipVisibleChanged
		do: [ :anEvent | self visible: anEvent visible ].

	self
		when: BrTooltipRelocateWish
		do: [ :aWish | self onRelocateWish: aWish ].
		
	self
		when: BrTooltipShowWish
		do: [ :aWish | self onShowWish: aWish ].
		
	self
		when: BrTooltipHideWish
		do: [ :aWish | self onHideWish: aWish ]
]

{ #category : #initialization }
BrWithTooltipAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrTooltipStencilRequest new.
	self request: BrTooltipVisibleRequest new
]

{ #category : #'host space - displaying' }
BrWithTooltipAptitude >> show [
	super show.
	self willShowLater
		ifTrue: [ self cancelShowLater ].
	self willHideLater
		ifTrue: [ self cancelHideLater ].
	innerContainer
		addEventFilterOn: BlMouseEnterEvent do: [ :e | self cancelHideLater ];
		addEventFilterOn: BlMouseLeaveEvent do: [ :e | self hideLater ]
]

{ #category : #accessing }
BrWithTooltipAptitude >> showDelay [
	^ showDelay
]

{ #category : #accessing }
BrWithTooltipAptitude >> showDelay: anObject [
	showDelay := anObject
]

{ #category : #accessing }
BrWithTooltipAptitude >> showLater [
	self assert: [ self canShow ].
	self cancelShowLater.
	showLaterTask := BlDelayedTaskAction new
		delay: self showDelay;
		action: [ self canShow
				ifTrue: [ self show ].
			showLaterTask := nil ];
		yourself.
	widget enqueueTask: showLaterTask
]

{ #category : #testing }
BrWithTooltipAptitude >> willHideLater [
	^ hideLaterTask isNotNil
]

{ #category : #testing }
BrWithTooltipAptitude >> willShowLater [
	^ showLaterTask isNotNil
]
