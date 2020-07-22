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

	self widgetDo: [ :aWidget | aWidget replaceChild: (widget childNamed: #content) with: content ]
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
	
	self widgetDo: [ :aWidget | aWidget replaceChild: (widget childNamed: #handle) with: handle ]
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
