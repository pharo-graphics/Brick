Class {
	#name : #BrWithTooltipLook,
	#superclass : #BrLook,
	#instVars : [
		'container',
		'pointer',
		'tooltip',
		'tooltipWrapper',
		'stencil',
		'hideLaterTask',
		'showLaterTask'
	],
	#category : #'Brick-Tooltip - UI'
}

{ #category : #accessing }
BrWithTooltipLook >> cancelHideLater [
	self assert: [ self visible ].
	hideLaterTask ifNotNil: [ container dequeueTask: hideLaterTask ].
	hideLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipLook >> cancelShowLater [
	self assert: [ self visible not ].
	showLaterTask
		ifNotNil: [ self widgetDo: [ :e | e dequeueTask: showLaterTask ] ].
	showLaterTask := nil
]

{ #category : #accessing }
BrWithTooltipLook >> hide [
	self assert: [ self visible ].
	container removeFromParent.
	container := nil
]

{ #category : #accessing }
BrWithTooltipLook >> hideLater [
	self assert: [ self visible ].
	self cancelHideLater.
	hideLaterTask := BlDelayedTaskAction new
		delay: 300 milliSeconds;
		action: [ self visible
				ifTrue: [ self hide ].
			hideLaterTask := nil ];
		yourself.
	container enqueueTask: hideLaterTask
]

{ #category : #initialization }
BrWithTooltipLook >> initialize [
	super initialize.
	self stencil: [ BlElement new ].
	self
		add:
			(BrInteractiveCommonLook new
				default: [ self willShowLater
						ifTrue: [ self cancelShowLater ].
					self visible
						ifTrue: [ self hideLater ] ];
				hovered: [ self willHideLater
						ifTrue: [ self cancelHideLater ].
					self visible
						ifFalse: [ self showLater ] ]).
	self
		addChange:
			(BrLookChange new
				up: [ :e |  ];
				down: [ :e | 
					self willShowLater
						ifTrue: [ self cancelShowLater ].
					self willHideLater
						ifTrue: [ self cancelHideLater ].
					self visible
						ifTrue: [ self hide ] ];
				yourself)
]

{ #category : #initialization }
BrWithTooltipLook >> initializeListeners [
	super initializeListeners.
	self
		when: BrTooltipStencilChanged
		do: [ :e | self stencil: e stencil ].
	self
		when: BrTooltipVisibleChanged
		do: [ :e | self visible: e visible ]
]

{ #category : #initialization }
BrWithTooltipLook >> initializeRequests [
	super initializeRequests.
	self request: BrTooltipStencilRequest new.
	self request: BrTooltipVisibleRequest new
]

{ #category : #'instance creation' }
BrWithTooltipLook >> newContainer [
	pointer := BlElement new
		size: 10 @ 10;
		padding: (BlInsets all: 5);
		yourself.
	tooltip := self stencil asElement.
	tooltipWrapper := tooltip asScrollableElement.
	tooltipWrapper == tooltip
		ifFalse: [ tooltipWrapper
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		addEventHandlerOn: BlMouseEnterEvent do: [ self cancelHideLater ];
		addEventHandlerOn: BlMouseLeaveEvent do: [ self hideLater ];
		in: [ :e | 
			e
				addEventHandlerOn: BlElementExtentChangedEvent
				do: [ e isAttachedToSceneGraph
						ifTrue: [ self relocateContainer ] ].
			widget
				addEventHandlerOn: BlElementExtentChangedEvent
					do: [ e isAttachedToSceneGraph
						ifTrue: [ self relocateContainer ] ];
				addEventHandlerOn: BlElementPositionInSpaceChangedEvent
					do: [ e isAttachedToSceneGraph
						ifTrue: [ self relocateContainer ] ] ];
		enqueueTask:
			(BlRepeatedTaskAction new
				delay: 500 milliSeconds;
				action: [ (self visible
						and: [ widget isNil or: [ widget isAttachedToSceneGraph not ] ])
						ifTrue: [ self hide ] ];
				yourself);
		addChild: pointer as: #pointer;
		addChild: tooltipWrapper as: #tooltip;
		yourself
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> relocateContainer [
	| positioner anchorBounds popupMaxBounds scale preferredPosition |
	self assert: [ container isAttachedToSceneGraph ].
	positioner := BrAnchoredPopupPositioner
		anchor: widget
		target: container parent.
	scale := widget globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	popupMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: (tooltip size + (0 @ pointer height)) * scale.
	positioner popupPreferredPositionIsTop
		ifTrue: [ container
				removeChildren;
				addChildren:
					{tooltipWrapper.
					pointer} ]
		ifFalse: [ container
				removeChildren;
				addChildren:
					{pointer.
					tooltipWrapper} ].
	positioner popupPreferredPositionIsLeft
		ifTrue: [ pointer constraintsDo: [ :c | c linear horizontal alignRight ] ]
		ifFalse: [ pointer constraintsDo: [ :c | c linear horizontal alignLeft ] ].
	tooltipWrapper
		constraintsDo: [ :c | 
			c maxWidth: popupMaxBounds width.
			c maxHeight: popupMaxBounds height ].
	positioner popupPreferredPosition = (#bottom -> #right)
		ifTrue: [ preferredPosition := anchorBounds bottomLeft ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue: [ preferredPosition := anchorBounds bottomRight
				- (tooltipWrapper width @ 0 * scale) ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue: [ preferredPosition := anchorBounds topLeft
				- (0 @ (tooltipWrapper height + pointer height) * scale) ].
	positioner popupPreferredPosition = (#top -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- ((tooltipWrapper size + (0 @ pointer height)) * scale) ].
	((widget width min: container width) - pointer width) / 2
		in: [ :e | pointer margin: (BlInsets left: e right: e) ].
	container
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				scaleBy: scale;
				translateBy: preferredPosition ]
]

{ #category : #'host space - displaying' }
BrWithTooltipLook >> show [
	self assert: [ self visible not ].
	self
		widgetDo: [ :aWidget | 
			aWidget isAttachedToSceneGraph
				ifTrue: [ aWidget topMostParent addChild: (container := self newContainer).
					self relocateContainer ] ]
]

{ #category : #accessing }
BrWithTooltipLook >> showLater [
	self assert: [ self visible not ].
	self cancelShowLater.
	showLaterTask := BlDelayedTaskAction new
		delay: 1000 milliSeconds;
		action: [ (self visible not and: [ widget visibility shouldDraw ])
				ifTrue: [ self show ].
			showLaterTask := nil ];
		yourself.
	widget enqueueTask: showLaterTask
]

{ #category : #accessing }
BrWithTooltipLook >> stencil [
	^ stencil
]

{ #category : #accessing }
BrWithTooltipLook >> stencil: aBrStencil [
	stencil := aBrStencil asStencil.
	self visible
		ifTrue: [ self
				hide;
				show ]
]

{ #category : #accessing }
BrWithTooltipLook >> visible [
	^ container isNotNil
]

{ #category : #accessing }
BrWithTooltipLook >> visible: aBoolean [
	aBoolean
		ifTrue: [ self visible
				ifFalse: [ self show ] ]
		ifFalse: [ self visible
				ifTrue: [ self hide ] ]
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> willHideLater [
	^ hideLaterTask isNotNil
]

{ #category : #'as yet unclassified' }
BrWithTooltipLook >> willShowLater [
	^ showLaterTask isNotNil
]
