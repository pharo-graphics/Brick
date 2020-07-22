Class {
	#name : #BrAnchoredLook,
	#superclass : #BrLook,
	#instVars : [
		'handle',
		'content',
		'scrollableContent',
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
	scrollableContent := content asScrollableElement.
	scrollableContent == content
		ifFalse: [ scrollableContent
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	self
		widgetDo: [ | i content_ |
			content_ := widget childNamed: #content.
			i := widget childIndexOf: content_.
			widget removeChild: content_.
			widget addChild: scrollableContent at: i as: #content ].
	self canRelocate
		ifTrue: [ self relocate ]
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
	self
		widgetDo: [ | i handle_ |
			handle_ := widget childNamed: #handle.
			i := widget childIndexOf: handle_.
			widget removeChild: handle_.
			widget addChild: handle at: i as: #handle ].
	self canRelocate
		ifTrue: [ self relocate ]
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

	scrollableContent := content asScrollableElement.

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
		addChangeAddChildAs: #(handle) with: [ handle ];
		addChangeAddChildAs: #(content) with: [ scrollableContent ]
]

{ #category : #'private - event handling' }
BrAnchoredLook >> onRelocateWish: aBrAnchoredRelocateWish [
	relocation := aBrAnchoredRelocateWish asRelocation.

	(aBrAnchoredRelocateWish anchor = widget anchor and: [ self canRelocate ])
		ifTrue: [ self relocate ]
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> relocate [
	"Call #relocateTo:handleAtTop:atLeft: and use relocation instance variable"

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredLook >> relocateTo: aPoint handleAtTop: aBoolean atLeft: anotherBoolean [
	widget
		removeChildNamed: #content;
		removeChildNamed: #handle.
	aBoolean
		ifTrue: [ widget
				addChild: scrollableContent as: #content;
				addChild: handle as: #handle ]
		ifFalse: [ widget
				addChild: handle as: #handle;
				addChild: scrollableContent as: #content ].
	anotherBoolean
		ifTrue: [ handle constraintsDo: [ :c | c linear horizontal alignRight ] ]
		ifFalse: [ handle constraintsDo: [ :c | c linear horizontal alignLeft ] ].
	widget
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				scaleBy: widget anchor globalScale;
				translateBy: aPoint ]
]
