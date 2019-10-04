Class {
	#name : #BrAnchoredLook,
	#superclass : #BrLook,
	#instVars : [
		'anchor',
		'handle',
		'content',
		'relocation',
		'relocateEventHandler'
	],
	#category : #'Brick-Anchored - Look'
}

{ #category : #accessing }
BrAnchoredLook >> anchor [
	^ anchor
]

{ #category : #accessing }
BrAnchoredLook >> anchor: anObject [
	anchor = anObject
		ifTrue: [ ^ self ].
	anchor := anObject.
	self canRelocate
		ifTrue: [ self relocate ]
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> anchorChangedClass [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> anchorRequest [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> canRelocate [
	^ widget isNotNil
		and:
			[ widget isAttachedToSceneGraph and: [ anchor isAttachedToSceneGraph ] ]
]

{ #category : #accessing }
BrAnchoredLook >> content [
	^ content
]

{ #category : #accessing }
BrAnchoredLook >> content: anElement [
	content = anElement
		ifTrue: [ ^ self ].
	content := anElement.
	self canRelocate
		ifTrue: [ self relocate ]
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> contentChangedClass [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> contentMaxBounds [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> contentRequest [
	self subclassResponsibility
]

{ #category : #accessing }
BrAnchoredLook >> handle [
	^ handle
]

{ #category : #accessing }
BrAnchoredLook >> handle: anElement [
	handle = anElement
		ifTrue: [ ^ self ].
	handle := anElement.
	self canRelocate
		ifTrue: [ self relocate ]
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> handleChangedClass [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> handleRequest [
	self subclassResponsibility
]

{ #category : #initialization }
BrAnchoredLook >> initialize [
	super initialize.
	handle := BlElement new
		size: 10 @ 10;
		padding: (BlInsets all: 5);
		yourself.
	content := BlElement new.
	relocateEventHandler := BlEventHandler
		on: self relocateWishClass
		do: [ :e | 
			relocation := e asRelocation.
			(e anchored = widget and: [ self canRelocate ])
				ifTrue: [ self relocate ] ].
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
BrAnchoredLook >> initializeListeners [
	super initializeListeners.
	self
		when: self handleChangedClass do: [ :e | self handle: e handle ];
		when: self contentChangedClass do: [ :e | self content: e content ];
		when: self anchorChangedClass do: [ :e | self anchor: e anchor ]
]

{ #category : #initialization }
BrAnchoredLook >> initializeRequests [
	super initializeRequests.
	self
		request: self handleRequest;
		request: self contentRequest;
		request: self anchorRequest
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> position [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> positioner [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> relocate [
	| scrollableContent positioner contentMaxBounds |
	self assert: [ self canRelocate ].
	scrollableContent := self scrollableContent.
	positioner := self positioner.
	contentMaxBounds := self contentMaxBounds.
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
			c maxWidth: contentMaxBounds width.
			c maxHeight: contentMaxBounds height ].
	self
		flag:
			'TODO is there a better way to force the redraw of a geometry if bounds did not change?'.
	widget
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				translateBy: self position;
				scaleBy: anchor globalScale ];
		geometry: widget geometry
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> relocateTo: aPoint maxBounds: aBounds handleAtTop: aBoolean atLeft: anotherBoolean [
	| scrollableContent |
	scrollableContent := self scrollableContent.
	self
		flag: 'FIXME for some reason removing children by name does not work'.
	aBoolean
		ifTrue: [ widget
				removeChildren;
				addChild: scrollableContent as: #scrollableContent;
				addChild: handle as: #handle ]
		ifFalse: [ widget
				removeChildren;
				addChild: handle as: #handle;
				addChild: scrollableContent as: #scrollableContent ].
	anotherBoolean
		ifTrue: [ handle constraintsDo: [ :c | c linear horizontal alignRight ] ]
		ifFalse: [ handle constraintsDo: [ :c | c linear horizontal alignLeft ] ].
	scrollableContent
		constraintsDo: [ :c | 
			c maxWidth: aBounds width.
			c maxHeight: aBounds height ].
	self
		flag:
			'TODO is there a better way to force the redraw of a geometry if bounds did not change?'.
	widget
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				translateBy: aPoint;
				scaleBy: anchor globalScale ];
		geometry: widget geometry
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> relocateWishClass [
	self subclassResponsibility
]

{ #category : #'examples - setup' }
BrAnchoredLook >> scrollableContent [
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
BrAnchoredLook >> unwrappedContent [
	^ content asScrollableElement == content
		ifTrue: [ content contentElement ]
		ifFalse: [ content ]
]
