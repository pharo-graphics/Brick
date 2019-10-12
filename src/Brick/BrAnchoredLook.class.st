Class {
	#name : #BrAnchoredLook,
	#superclass : #BrLook,
	#instVars : [
		'handle',
		'content',
		'relocation',
		'relocateEventHandler'
	],
	#category : #'Brick-Anchored - Look'
}

{ #category : #'as yet unclassified' }
BrAnchoredLook >> canRelocate [
	^ relocation isNotNil
		and: [ widget isNotNil
				and: [ widget isAttachedToSceneGraph
						and: [ widget anchor isNotNil and: [ widget anchor isAttachedToSceneGraph ] ] ] ]
]

{ #category : #accessing }
BrAnchoredLook >> content [
	^ content
]

{ #category : #accessing }
BrAnchoredLook >> content: anElement [
	| element |
	element := anElement asElement.
	content = element
		ifTrue: [ ^ self ].
	content := element.
	self canRelocate
		ifTrue: [ self relocate ]
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> contentChangedClass [
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
	| element |
	element := anElement asElement.
	handle = element
		ifTrue: [ ^ self ].
	handle := element.
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

{ #category : #accessing }
BrAnchoredLook >> hide [
	widget anchor
		ifNotNil: [ :e | 
			e
				dispatchEvent:
					(self hideWish
						anchor: e;
						yourself) ]
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> hideWish [
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
			(e anchor = widget anchor
				and: [ e anchored = widget and: [ self canRelocate ] ])
				ifTrue: [ self relocate ] ].
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout vertical ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer fitContent ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer fitContent ];
		addChangeProperty: #(widget geometry)
			with: [ BrAnchoredGeometry element: widget ];
		addChangeProperty: #(widget outskirts)
			with: [ BlOutskirts outside ];
		addChangeAddChildAs: #(handle) with: [ self handle ];
		addChangeAddChildAs: #(content) with: [ self content ];
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
		when: self contentChangedClass do: [ :e | self content: e content ]
]

{ #category : #initialization }
BrAnchoredLook >> initializeRequests [
	super initializeRequests.
	self
		request: self handleRequest;
		request: self contentRequest
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> relocate [
	"Call #relocateTo:content:handleAtTop:atLeft: and use relocation instance variable"

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> relocateTo: aPoint content: anElement handleAtTop: aBoolean atLeft: anotherBoolean [
	self
		flag: 'FIXME for some reason removing children by name does not work'.
	aBoolean
		ifTrue: [ widget
				removeChildren;
				addChild: anElement as: #content;
				addChild: handle as: #handle ]
		ifFalse: [ widget
				removeChildren;
				addChild: handle as: #handle;
				addChild: anElement as: #content ].
	anotherBoolean
		ifTrue: [ handle constraintsDo: [ :c | c linear horizontal alignRight ] ]
		ifFalse: [ handle constraintsDo: [ :c | c linear horizontal alignLeft ] ].
	self
		flag:
			'TODO is there a better way to force the redraw of a geometry if bounds did not change?'.
	widget
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				translateBy: aPoint;
				scaleBy: widget anchor globalScale ];
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
