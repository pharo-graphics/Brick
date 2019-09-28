Class {
	#name : #BrContextMenuLook,
	#superclass : #BrLook,
	#instVars : [
		'relocateEventHandler',
		'handle',
		'content',
		'lastRelocation'
	],
	#category : #'Brick-Context Menu - Look'
}

{ #category : #'as yet unclassified' }
BrContextMenuLook >> canRelocateIn: anElement [
	^ widget isNotNil
		and: [ widget isAttachedToSceneGraph
				and: [ anElement isAttachedToSceneGraph ] ]
]

{ #category : #accessing }
BrContextMenuLook >> content [
	^ content
]

{ #category : #accessing }
BrContextMenuLook >> content: anElement [
	content = anElement
		ifTrue: [ ^ self ].
	content := anElement.
	(lastRelocation isNotNil
		and: [ self canRelocateIn: lastRelocation value ])
		ifTrue: [ self relocateTo: lastRelocation key in: lastRelocation value ]
]

{ #category : #accessing }
BrContextMenuLook >> handle [
	^ handle
]

{ #category : #accessing }
BrContextMenuLook >> handle: anElement [
	handle = anElement
		ifTrue: [ ^ self ].
	handle := anElement.
	(lastRelocation isNotNil
		and: [ self canRelocateIn: lastRelocation value ])
		ifTrue: [ self relocateTo: lastRelocation key in: lastRelocation value ]
]

{ #category : #initialization }
BrContextMenuLook >> initialize [
	super initialize.
	handle := BlElement new
		size: 10 @ 10;
		padding: (BlInsets all: 5);
		yourself.
	content := BlElement new.
	relocateEventHandler := BlEventHandler
		on: BrContextMenuRelocateWish
		do: [ :e | 
			self
				widgetDo: [ (e container = widget and: [ self canRelocateIn: e anchor ])
						ifTrue: [ self relocateTo: e position in: e anchor ] ] ].
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout vertical ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer fitContent ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer fitContent ];
		addChangeAddChildAs: #(handle) with: [ self handle ];
		addChangeAddChildAs: #(scrollableContent)
			with: [ self scrollableContent ];
		addChange:
			(BrLookChange new
				up: [ :e | widget addEventHandler: relocateEventHandler ];
				down: [ :e | widget removeEventHandler: relocateEventHandler ];
				yourself)
]

{ #category : #initialization }
BrContextMenuLook >> initializeListeners [
	super initializeListeners.
	self
		when: BrContextMenuHandleChanged do: [ :e | self handle: e handle ];
		when: BrContextMenuContentChanged
			do: [ :e | self content: e content ]
]

{ #category : #initialization }
BrContextMenuLook >> initializeRequests [
	super initializeRequests.
	self request: BrContextMenuHandleRequest new.
	self request: BrContextMenuContentRequest new
]

{ #category : #'as yet unclassified' }
BrContextMenuLook >> relocateTo: aPoint in: anElement [
	| unwrappedContent scrollableContent positioner anchorBounds popupMaxBounds scale preferredPosition |
	self assert: [ self canRelocateIn: anElement ].
	lastRelocation := aPoint -> anElement.
	unwrappedContent := self unwrappedContent.
	scrollableContent := self scrollableContent.
	positioner := BrAnchoredPopupPositioner
		anchorBoundsInTarget:
			((anElement localPointToGlobal: aPoint) - (handle size / 2)
				extent: handle size)
		target: widget parent.
	scale := widget globalScale.
	anchorBounds := positioner anchorBoundsInTarget.
	popupMaxBounds := positioner
		popupPreferredMaxBoundsInTarget: unwrappedContent size * scale.
	self
		flag: 'FIXME for some reason removing children by name does not work'.
	positioner popupPreferredPositionIsTop
		ifTrue: [ widget
				removeChildren;
				addChild: scrollableContent as: #scrollableContent;
				addChild: handle as: #handle ]
		ifFalse: [ widget
				removeChildren;
				addChild: handle as: #handle;
				addChild: scrollableContent as: #scrollableContent ].
	positioner popupPreferredPositionIsLeft
		ifTrue: [ handle constraintsDo: [ :c | c linear horizontal alignRight ] ]
		ifFalse: [ handle constraintsDo: [ :c | c linear horizontal alignLeft ] ].
	scrollableContent
		constraintsDo: [ :c | 
			c maxWidth: popupMaxBounds width.
			c maxHeight: popupMaxBounds height ].
	positioner popupPreferredPosition = (#bottom -> #right)
		ifTrue: [ preferredPosition := anchorBounds topLeft ].
	positioner popupPreferredPosition = (#bottom -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- (scrollableContent width @ 0 * scale) ].
	positioner popupPreferredPosition = (#top -> #right)
		ifTrue: [ preferredPosition := anchorBounds topLeft
				- (0 @ scrollableContent height * scale) ].
	positioner popupPreferredPosition = (#top -> #left)
		ifTrue: [ preferredPosition := anchorBounds topRight
				- (scrollableContent size * scale) ].
	self
		flag:
			'TODO is there a better way to force the redraw of a geometry if bounds did not change?'.
	widget
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				scaleBy: scale;
				translateBy: preferredPosition ];
		geometry: widget geometry
]

{ #category : #'examples - setup' }
BrContextMenuLook >> scrollableContent [
	| scrollableContent |
	scrollableContent := content asScrollableElement.
	scrollableContent == content
		ifFalse: [ scrollableContent
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	^ scrollableContent
]

{ #category : #accessing }
BrContextMenuLook >> unwrappedContent [
	^ content asScrollableElement == content
		ifTrue: [ content contentElement ]
		ifFalse: [ content ]
]
