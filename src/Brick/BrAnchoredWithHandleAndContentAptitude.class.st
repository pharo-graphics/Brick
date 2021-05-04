Class {
	#name : #BrAnchoredWithHandleAndContentAptitude,
	#superclass : #BrAnchoredAptitude,
	#instVars : [
		'handle',
		'contentWrapper'
	],
	#category : #'Brick-Anchored - Look'
}

{ #category : #accessing }
BrAnchoredWithHandleAndContentAptitude >> content [
	<return: #BlElement>

	^ contentWrapper children first
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentAptitude >> content: anElement [
	self content = anElement
		ifTrue: [ ^ self ].

	contentWrapper removeChildren.
	contentWrapper addChild: anElement
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentAptitude >> handle [
	^ handle
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentAptitude >> handle: anElement [
	handle = anElement
		ifTrue: [ ^ self ].

	handle := anElement.
	handle removeFromParent.
	
	self widgetDo: [ :aWidget | aWidget replaceChild: (widget childNamed: #handle) with: handle ]
]

{ #category : #initialization }
BrAnchoredWithHandleAndContentAptitude >> initialize [
	super initialize.

	handle := BlElement new
		size: 8 @ 8;
		yourself.
	
	contentWrapper := BlElement new.
	contentWrapper layout: BlLinearLayout vertical.
	contentWrapper addChild: BlElement new.

	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout vertical ];
		addChangeProperty: #(widget outskirts)
			with: [ BlOutskirts outside ];
		addChangeAddChildAs: #(handle) with: [ handle ];
		addChangeAddChildAs: #(content) with: [ contentWrapper ]
]
