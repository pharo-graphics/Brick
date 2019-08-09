Class {
	#name : #BrGlamorousWithTooltipLook,
	#superclass : #BrLook,
	#instVars : [
		'popupStencil',
		'container',
		'popup',
		'popupWrapper',
		'pointer'
	],
	#category : #'Brick-Glamorous-Tooltip'
}

{ #category : #accessing }
BrGlamorousWithTooltipLook >> hide [
	container ifNotNil: #removeFromParent.
	container := nil
]

{ #category : #initialization }
BrGlamorousWithTooltipLook >> initialize [
	super initialize.
	self popupStencil: [ BlElement new ].
	self
		add:
			(BrInteractiveCommonLook new
				default: [ self hide ];
				hovered: [ self show ]).
	self
		addChange:
			(BrLookChange new
				up: [ :e |  ];
				down: [ :e | self hide ];
				yourself)
]

{ #category : #initialization }
BrGlamorousWithTooltipLook >> initializeListeners [
	super initializeListeners.
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrGlamorousWithTooltipLook >> initializeRequests [
	super initializeRequests.
	self request: BrLabelRequest new
]

{ #category : #'instance creation' }
BrGlamorousWithTooltipLook >> newContainer [
	pointer := BlElement new
		size: 10 @ 10;
		padding: (BlInsets all: 5);
		yourself.
	popup := self popupStencil asElement.
	popupWrapper := popup asScrollableElement.
	popupWrapper == popup
		ifFalse: [ popupWrapper
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	^ BlElement new
		when: BlElementExtentChangedEvent do: [ self relocateContainer ];
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		in: [ :e | 
			e
				geometry:
					(BrGlamorousDropdownGeometry new
						dropdown: e;
						cornerRadius: 5;
						yourself) ];
		background: Color white;
		border:
			(BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1);
		look: BrShadowLook new;
		addChild: pointer as: #pointer;
		addChild: popupWrapper as: #popup;
		yourself
]

{ #category : #accessing }
BrGlamorousWithTooltipLook >> popupStencil [
	^ popupStencil
]

{ #category : #accessing }
BrGlamorousWithTooltipLook >> popupStencil: aBrStencil [
	popupStencil := aBrStencil asStencil
]

{ #category : #'as yet unclassified' }
BrGlamorousWithTooltipLook >> relocateContainer [
	| positioner anchorBounds popupMaxBounds scale preferredPosition |
	container parent ifNil: [ ^ self ].
	positioner := BrAnchoredPopupPositioner
		anchor: widget
		target: container parent.
	scale := widget globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	popupMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: (popup size + (0 @ pointer height)) * scale.
	positioner popupPreferredPositionIsTop
		ifTrue: [ container
				removeChildren;
				addChildren:
					{popupWrapper.
					pointer} ]
		ifFalse: [ container
				removeChildren;
				addChildren:
					{pointer.
					popupWrapper} ].
	positioner popupPreferredPositionIsLeft
		ifTrue: [ pointer constraintsDo: [ :c | c linear horizontal alignRight ] ]
		ifFalse: [ pointer constraintsDo: [ :c | c linear horizontal alignLeft ] ].
	popupWrapper
		constraintsDo: [ :c | 
			c maxWidth: popupMaxBounds width.
			c maxHeight: popupMaxBounds height ].
	positioner popupPreferredPosition = (#bottom -> #right)
		ifTrue: [ preferredPosition := anchorBounds bottomLeft ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue: [ preferredPosition := anchorBounds bottomRight
				- (popupWrapper width @ 0 * scale) ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue: [ preferredPosition := anchorBounds topLeft
				- (0 @ (popupWrapper height + pointer height) * scale) ].
	positioner popupPreferredPosition = (#top -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- ((popupWrapper size + (0 @ pointer height)) * scale) ].
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
BrGlamorousWithTooltipLook >> show [
	self hide.
	self
		widgetDo: [ :aWidget | 
			aWidget isAttachedToSceneGraph
				ifTrue: [ aWidget space addChild: (container := self newContainer).
					self relocateContainer ] ]
]

{ #category : #accessing }
BrGlamorousWithTooltipLook >> text: aTextOrString [
	self
		popupStencil: [ BrLabel new
				look: BrGlamorousLabelLook;
				text: aTextOrString;
				padding: (BlInsets all: 5);
				yourself ]
]
