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
BrWithTooltipLook class >> anchoredLookClass [
	^ BrTooltipLook
]

{ #category : #accessing }
BrWithTooltipLook >> cancelHideLater [
	hideLaterTask ifNotNil: #dequeue.
	hideLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipLook >> cancelShowLater [
	showLaterTask ifNotNil: #dequeue.
	showLaterTask := nil
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
	self assert: [ self visible ].
	self cancelHideLater.
	hideLaterTask := BlDelayedTaskAction new
		delay: self hideDelay;
		action: [ self visible
				ifTrue: [ self hide ].
			hideLaterTask := nil ];
		yourself.
	container enqueueTask: hideLaterTask
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> hideWishClass [
	^ BrTooltipHideWish
]

{ #category : #initialization }
BrWithTooltipLook >> initialize [
	super initialize.
	clickEventHandler := BlEventHandler
		on: BlClickEvent
		do: [ self willHideLater
				ifTrue: [ self cancelHideLater ].
			self visible
				ifTrue: [ self hide ] ].
	overEventHandler := BlEventHandler
		on: BlMouseOverEvent
		do: [ :e | 
			self willHideLater
				ifTrue: [ self cancelHideLater ].
			self visible
				ifFalse: [ self showLater ] ].
	outEventHandler := BlEventHandler
		on: BlMouseOutEvent
		do: [ :e | 
			self willShowLater
				ifTrue: [ self cancelShowLater ].
			self visible
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
BrWithTooltipLook >> relocateWish [
	^ BrTooltipRelocateWish new
]

{ #category : #'host space - displaying' }
BrWithTooltipLook >> show [
	super show.
	self willShowLater
		ifTrue: [ self cancelShowLater ].
	self willHideLater
		ifTrue: [ self cancelHideLater ].
	container
		addEventHandlerOn: BlMouseOverEvent do: [ self cancelHideLater ];
		addEventHandlerOn: BlMouseOutEvent do: [ self hideLater ]
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
	self assert: [ self visible not ].
	self cancelShowLater.
	showLaterTask := BlDelayedTaskAction new
		delay: self showDelay;
		action: [ (self visible not and: [ widget visibility shouldDraw ])
				ifTrue: [ self show ].
			showLaterTask := nil ];
		yourself.
	widget enqueueTask: showLaterTask
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> showWishClass [
	^ BrTooltipShowWish
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> stencilChangedClass [
	^ BrTooltipStencilChanged
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> stencilRequest [
	^ BrTooltipStencilRequest new
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> visibleChangedClass [
	^ BrTooltipVisibleChanged
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> visibleRequest [
	^ BrTooltipVisibleRequest new
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> willHideLater [
	^ hideLaterTask isNotNil
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> willShowLater [
	^ showLaterTask isNotNil
]
