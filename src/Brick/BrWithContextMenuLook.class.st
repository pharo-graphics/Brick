Class {
	#name : #BrWithContextMenuLook,
	#superclass : #BrLook,
	#instVars : [
		'container',
		'pointer',
		'tooltip',
		'tooltipWrapper',
		'stencil',
		'clickOutsideEventHandler',
		'clickEventHandler',
		'pressEscEventHandler',
		'position'
	],
	#category : #'Brick-Context Menu - UI'
}

{ #category : #accessing }
BrWithContextMenuLook >> hide [
	self assert: [ self visible ].
	widget topMostParent
		removeEventFilter: clickOutsideEventHandler;
		removeEventHandler: pressEscEventHandler.
	container removeFromParent.
	container := nil
]

{ #category : #initialization }
BrWithContextMenuLook >> initialize [
	super initialize.
	clickOutsideEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			(e target ~~ container and: [ (e target hasParent: container) not ])
				ifTrue: [ self visible
						ifTrue: [ self hide ] ] ].
	clickEventHandler := BlEventHandler
		on: BlMouseUpEvent
		do: [ :e | 
			position := e position.
			e button = BlMouseButton secondary
				ifTrue: [ self visible
						ifTrue: [ self hide ].
					self show ] ].
	pressEscEventHandler := BlEventHandler
		on: BlKeyUpEvent
		do: [ :e | 
			e key = BlKeyboardKey escape
				ifTrue: [ self visible
						ifTrue: [ self hide ] ] ].
	self
		stencil: [ BlElement new
				size: 100 @ 20;
				yourself ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventHandler: clickEventHandler ];
				down: [ :e | 
					self visible
						ifTrue: [ self hide ].
					widget removeEventHandler: clickEventHandler ];
				yourself)
]

{ #category : #initialization }
BrWithContextMenuLook >> initializeListeners [
	super initializeListeners.
	self
		when: BrContextMenuStencilChanged
		do: [ :e | self stencil: e stencil ].
	self
		when: BrContextMenuVisibleChanged
		do: [ :e | self visible: e visible ]
]

{ #category : #initialization }
BrWithContextMenuLook >> initializeRequests [
	super initializeRequests.
	self request: BrContextMenuStencilRequest new.
	self request: BrContextMenuVisibleRequest new
]

{ #category : #'instance creation' }
BrWithContextMenuLook >> newContainer [
	pointer := self newPointer.
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

{ #category : #'instance creation' }
BrWithContextMenuLook >> newPointer [
	^ BlElement new
		size: 10 @ 10;
		padding: (BlInsets all: 5);
		yourself
]

{ #category : #'as yet unclassified' }
BrWithContextMenuLook >> relocateContainer [
	"adds a probe element at the click mouse position and removes it afterwards"

	| positioner anchorBounds popupMaxBounds scale preferredPosition |
	self assert: [ container isAttachedToSceneGraph ].
	positioner := BrAnchoredPopupPositioner
		anchorBoundsInTarget: (position - (pointer size / 2) extent: pointer size)
		target: container parent.
	scale := widget globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	popupMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: tooltip size * scale.
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
		ifTrue: [ preferredPosition := anchorBounds topLeft ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- (tooltipWrapper width @ 0 * scale) ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue: [ preferredPosition := anchorBounds topLeft
				- (0 @ tooltipWrapper height * scale) ].
	positioner popupPreferredPosition = (#top -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- (tooltipWrapper size * scale) ].
	container
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				scaleBy: scale;
				translateBy: preferredPosition ]
]

{ #category : #'host space - displaying' }
BrWithContextMenuLook >> show [
	self assert: [ self visible not ].
	self
		widgetDo: [ :aWidget | 
			aWidget isAttachedToSceneGraph
				ifTrue: [ aWidget topMostParent addChild: (container := self newContainer).
					self relocateContainer ].
			aWidget topMostParent
				addEventFilter: clickOutsideEventHandler;
				addEventHandler: pressEscEventHandler ]
]

{ #category : #accessing }
BrWithContextMenuLook >> stencil [
	^ stencil
]

{ #category : #accessing }
BrWithContextMenuLook >> stencil: aBrStencil [
	stencil := aBrStencil asStencil.
	self visible
		ifTrue: [ self
				hide;
				show ]
]

{ #category : #accessing }
BrWithContextMenuLook >> visible [
	^ container isNotNil
]

{ #category : #accessing }
BrWithContextMenuLook >> visible: aBoolean [
	aBoolean
		ifTrue: [ self visible
				ifFalse: [ self show ] ]
		ifFalse: [ self visible
				ifTrue: [ self hide ] ]
]
