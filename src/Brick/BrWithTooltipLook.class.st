Class {
	#name : #BrWithTooltipLook,
	#superclass : #BrWithAnchoredLook,
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

{ #category : #'as yet unclassified' }
BrWithTooltipLook class >> anchoredLook [
	^ self anchoredLookClass new
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook class >> anchoredLookClass [
	^ BrTooltipLook
]

{ #category : #accessing }
BrWithTooltipLook class >> content: anObject [
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
BrWithTooltipLook class >> handle: anObject content: anotherObject [
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

{ #category : #accessing }
BrWithTooltipLook >> cancelHideLater [
	hideLaterTask ifNotNil: [ :aTask | aTask stop ].
	hideLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipLook >> cancelShowLater [
	showLaterTask ifNotNil: [ :aTask | aTask stop ].
	showLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipLook >> contentStencil: aStencil [
	self stencil: [ 
		BlElement new
			look: (self class anchoredLook
						withAnchoredLook: self;
						content: aStencil asStencil asElement) ]
]

{ #category : #accessing }
BrWithTooltipLook >> hide [
	super hide.
	self willShowLater
		ifTrue: [ self cancelShowLater ].
	self willHideLater
		ifTrue: [ self cancelHideLater ]
]

{ #category : #accessing }
BrWithTooltipLook >> hideDelay [
	^ hideDelay
]

{ #category : #accessing }
BrWithTooltipLook >> hideDelay: anObject [
	hideDelay := anObject
]

{ #category : #accessing }
BrWithTooltipLook >> hideLater [
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
BrWithTooltipLook >> initialize [
	super initialize.
	preferredExtent := 200 @ 50.
	strategy := BrAnchoredCompositeStrategy builder
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomCenterReferencePoint;
				availableBounds: BrAnchoredBottomCenterAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipTopCenterLook;
						remove: BrTooltipCenterLeftLook;
						remove: BrTooltipCenterRightLook;
						remove: BrTooltipBottomLeftLook;
						remove: BrTooltipBottomRightLook;
						remove: BrTooltipTopLeftLook;
						remove: BrTooltipTopRightLook;
						add: BrTooltipBottomCenterLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopCenterReferencePoint;
				availableBounds: BrAnchoredTopCenterAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipBottomCenterLook;
						remove: BrTooltipCenterLeftLook;
						remove: BrTooltipCenterRightLook;
						remove: BrTooltipBottomLeftLook;
						remove: BrTooltipBottomRightLook;
						remove: BrTooltipTopLeftLook;
						remove: BrTooltipTopRightLook;
						add: BrTooltipTopCenterLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterRightReferencePoint;
				availableBounds: BrAnchoredCenterRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipBottomCenterLook;
						remove: BrTooltipTopCenterLook;
						remove: BrTooltipCenterLeftLook;
						remove: BrTooltipBottomLeftLook;
						remove: BrTooltipBottomRightLook;
						remove: BrTooltipTopLeftLook;
						remove: BrTooltipTopRightLook;
						add: BrTooltipCenterRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredCenterLeftReferencePoint;
				availableBounds: BrAnchoredCenterLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipBottomCenterLook;
						remove: BrTooltipTopCenterLook;
						remove: BrTooltipCenterRightLook;
						remove: BrTooltipBottomLeftLook;
						remove: BrTooltipBottomRightLook;
						remove: BrTooltipTopLeftLook;
						remove: BrTooltipTopRightLook;
						add: BrTooltipCenterLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomLeftReferencePoint;
				availableBounds: BrAnchoredBottomLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipBottomCenterLook;
						remove: BrTooltipTopCenterLook;
						remove: BrTooltipCenterLeftLook;
						remove: BrTooltipCenterRightLook;
						remove: BrTooltipBottomRightLook;
						remove: BrTooltipTopLeftLook;
						remove: BrTooltipTopRightLook;
						add: BrTooltipBottomLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredBottomRightReferencePoint;
				availableBounds: BrAnchoredBottomRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipBottomCenterLook;
						remove: BrTooltipTopCenterLook;
						remove: BrTooltipCenterLeftLook;
						remove: BrTooltipCenterRightLook;
						remove: BrTooltipBottomLeftLook;
						remove: BrTooltipTopLeftLook;
						remove: BrTooltipTopRightLook;
						add: BrTooltipBottomRightLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopLeftReferencePoint;
				availableBounds: BrAnchoredTopLeftAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipBottomCenterLook;
						remove: BrTooltipTopCenterLook;
						remove: BrTooltipCenterLeftLook;
						remove: BrTooltipCenterRightLook;
						remove: BrTooltipBottomLeftLook;
						remove: BrTooltipBottomRightLook;
						remove: BrTooltipTopRightLook;
						add: BrTooltipTopLeftLook ] ];
		single: [ :e | 
			e
				anchorBounds: [ :f | widget bounds inParent: f ];
				referencePoint: BrAnchoredTopRightReferencePoint;
				availableBounds: BrAnchoredTopRightAvailableBounds;
				scaleFactor: BrAnchoredGlobalScaleFactor;
				apply: [ innerContainer look
						remove: BrTooltipBottomCenterLook;
						remove: BrTooltipTopCenterLook;
						remove: BrTooltipCenterLeftLook;
						remove: BrTooltipCenterRightLook;
						remove: BrTooltipBottomLeftLook;
						remove: BrTooltipBottomRightLook;
						remove: BrTooltipTopLeftLook;
						add: BrTooltipTopRightLook ] ];
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
BrWithTooltipLook >> initializeListeners [
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
BrWithTooltipLook >> initializeRequests [
	super initializeRequests.

	self request: BrTooltipStencilRequest new.
	self request: BrTooltipVisibleRequest new
]

{ #category : #'host space - displaying' }
BrWithTooltipLook >> show [
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
BrWithTooltipLook >> showDelay [
	^ showDelay
]

{ #category : #accessing }
BrWithTooltipLook >> showDelay: anObject [
	showDelay := anObject
]

{ #category : #accessing }
BrWithTooltipLook >> showLater [
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
BrWithTooltipLook >> willHideLater [
	^ hideLaterTask isNotNil
]

{ #category : #testing }
BrWithTooltipLook >> willShowLater [
	^ showLaterTask isNotNil
]
