Class {
	#name : #BrWithTooltipLook2,
	#superclass : #BrWithAnchoredLook2,
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
BrWithTooltipLook2 class >> anchoredLook [
	^ self anchoredLookClass new
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 class >> anchoredLookClass [
	^ BrTooltipLook2
]

{ #category : #accessing }
BrWithTooltipLook2 class >> content: anObject [
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
BrWithTooltipLook2 class >> handle: anObject content: anotherObject [
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
BrWithTooltipLook2 >> cancelHideLater [
	hideLaterTask ifNotNil: #dequeue.
	hideLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipLook2 >> cancelShowLater [
	showLaterTask ifNotNil: #dequeue.
	showLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipLook2 >> contentStencil: aStencil [
	self stencil: [ 
		BlElement new
			look: (self class anchoredLook
						withAnchoredLook: self;
						content: aStencil asStencil asElement) ]
]

{ #category : #accessing }
BrWithTooltipLook2 >> hide [
	super hide.
	self willShowLater
		ifTrue: [ self cancelShowLater ].
	self willHideLater
		ifTrue: [ self cancelHideLater ]
]

{ #category : #accessing }
BrWithTooltipLook2 >> hideDelay [
	^ hideDelay
]

{ #category : #accessing }
BrWithTooltipLook2 >> hideDelay: anObject [
	hideDelay := anObject
]

{ #category : #accessing }
BrWithTooltipLook2 >> hideLater [
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

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> hideWishClass [
	^ BrTooltipHideWish
]

{ #category : #initialization }
BrWithTooltipLook2 >> initialize [
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
		on: BlMouseOverEvent
		do: [ :e | 
			self willHideLater
				ifTrue: [ self cancelHideLater ].
			self canShow
				ifTrue: [ self showLater ] ].
	outEventHandler := BlEventHandler
		on: BlMouseOutEvent
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

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> relocateWishClass [
	^ BrTooltipRelocateWish
]

{ #category : #'host space - displaying' }
BrWithTooltipLook2 >> show [
	super show.
	self willShowLater
		ifTrue: [ self cancelShowLater ].
	self willHideLater
		ifTrue: [ self cancelHideLater ].
	innerContainer
		addEventFilterOn: BlMouseOverEvent do: [ :e | self cancelHideLater ];
		addEventFilterOn: BlMouseOutEvent do: [ :e | self hideLater ]
]

{ #category : #accessing }
BrWithTooltipLook2 >> showDelay [
	^ showDelay
]

{ #category : #accessing }
BrWithTooltipLook2 >> showDelay: anObject [
	showDelay := anObject
]

{ #category : #accessing }
BrWithTooltipLook2 >> showLater [
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

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> showWishClass [
	^ BrTooltipShowWish
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> stencilChangedClass [
	^ BrTooltipStencilChanged
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> stencilRequest [
	^ BrTooltipStencilRequest new
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> visibleChangedClass [
	^ BrTooltipVisibleChanged
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> visibleRequest [
	^ BrTooltipVisibleRequest new
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> willHideLater [
	^ hideLaterTask isNotNil
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook2 >> willShowLater [
	^ showLaterTask isNotNil
]
