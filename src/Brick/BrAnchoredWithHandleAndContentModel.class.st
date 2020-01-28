Class {
	#name : #BrAnchoredWithHandleAndContentModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'content',
		'handle'
	],
	#category : #'Brick-Anchored - Model'
}

{ #category : #accessing }
BrAnchoredWithHandleAndContentModel >> content [
	^ content
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentModel >> content: anObject [
	content = anObject
		ifTrue: [ ^ self ].
	content := anObject.
	self notifyContentChanged
]

{ #category : #notifying }
BrAnchoredWithHandleAndContentModel >> contentChangedEvent [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredWithHandleAndContentModel >> contentRequestClass [
	self subclassResponsibility
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentModel >> handle [
	^ handle
]

{ #category : #accessing }
BrAnchoredWithHandleAndContentModel >> handle: anObject [
	handle = anObject
		ifTrue: [ ^ self ].
	handle := anObject.
	self notifyHandleChanged
]

{ #category : #notifying }
BrAnchoredWithHandleAndContentModel >> handleChangedEvent [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredWithHandleAndContentModel >> handleRequestClass [
	self subclassResponsibility
]

{ #category : #initialization }
BrAnchoredWithHandleAndContentModel >> initialize [
	super initialize.
	handle := BlElement new
		size: 8 @ 8;
		yourself.
	content := BlElement new
]

{ #category : #initialization }
BrAnchoredWithHandleAndContentModel >> initializeListeners [
	super initializeListeners.
	self
		when: self contentRequestClass
			reply: [ :e | 
			e
				content: self content;
				yourself ];
		when: self handleRequestClass
			reply: [ :e | 
			e
				handle: self handle;
				yourself ]
]

{ #category : #notifying }
BrAnchoredWithHandleAndContentModel >> notifyContentChanged [
	self
		dispatchEvent:
			(self contentChangedEvent
				content: self content;
				yourself)
]

{ #category : #notifying }
BrAnchoredWithHandleAndContentModel >> notifyHandleChanged [
	self
		dispatchEvent:
			(self handleChangedEvent
				handle: self handle;
				yourself)
]
