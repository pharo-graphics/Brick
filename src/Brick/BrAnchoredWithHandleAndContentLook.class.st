Class {
	#name : #BrAnchoredWithHandleAndContentLook,
	#superclass : #BrAnchoredLook2,
	#instVars : [
		'handle',
		'content'
	],
	#category : #'Brick-Anchored - Look'
}

{ #category : #accessing }
BrAnchoredWithHandleAndContentLook >> content [
	^ content
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentLook >> content: anElement [
	content = anElement
		ifTrue: [ ^ self ].
	content := anElement.
	content removeFromParent.
	self
		widgetDo: [ | i content_ |
			content_ := widget childNamed: #content.
			i := widget childIndexOf: content_.
			widget removeChild: content_.
			widget addChild: content at: i as: #content ]
]

{ #category : #'as yet unclassified' }
BrAnchoredWithHandleAndContentLook >> contentChangedClass [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredWithHandleAndContentLook >> contentRequest [
	self subclassResponsibility
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentLook >> handle [
	^ handle
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentLook >> handle: anElement [
	handle = anElement
		ifTrue: [ ^ self ].
	handle := anElement.
	handle removeFromParent.
	self
		widgetDo: [ | i handle_ |
			handle_ := widget childNamed: #handle.
			i := widget childIndexOf: handle_.
			widget removeChild: handle_.
			widget addChild: handle at: i as: #handle ]
]

{ #category : #'as yet unclassified' }
BrAnchoredWithHandleAndContentLook >> handleChangedClass [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredWithHandleAndContentLook >> handleRequest [
	self subclassResponsibility
]

{ #category : #initialization }
BrAnchoredWithHandleAndContentLook >> initialize [
	super initialize.
	handle := BlElement new
		size: 8 @ 8;
		yourself.
	content := BlElement new.
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout vertical ];
		addChangeProperty: #(widget outskirts)
			with: [ BlOutskirts outside ];
		addChangeAddChildAs: #(handle) with: [ handle ];
		addChangeAddChildAs: #(content) with: [ content ]
]

{ #category : #initialization }
BrAnchoredWithHandleAndContentLook >> initializeListeners [
	super initializeListeners.
	self
		when: self handleChangedClass do: [ :e | self handle: e handle ];
		when: self contentChangedClass do: [ :e | self content: e content ]
]

{ #category : #initialization }
BrAnchoredWithHandleAndContentLook >> initializeRequests [
	super initializeRequests.
	self
		request: self handleRequest;
		request: self contentRequest
]
