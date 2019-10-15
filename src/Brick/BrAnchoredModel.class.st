Class {
	#name : #BrAnchoredModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'content',
		'handle'
	],
	#category : #'Brick-Anchored - Model'
}

{ #category : #accessing }
BrAnchoredModel >> content [
	^ content
]

{ #category : #accessing }
BrAnchoredModel >> content: anObject [
	content = anObject
		ifTrue: [ ^ self ].
	content := anObject.
	self notifyContentChanged
]

{ #category : #notifying }
BrAnchoredModel >> contentChangedEvent [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredModel >> contentRequestClass [
	self subclassResponsibility
]

{ #category : #accessing }
BrAnchoredModel >> handle [
	^ handle
]

{ #category : #accessing }
BrAnchoredModel >> handle: anObject [
	handle = anObject
		ifTrue: [ ^ self ].
	handle := anObject.
	self notifyHandleChanged
]

{ #category : #notifying }
BrAnchoredModel >> handleChangedEvent [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrAnchoredModel >> handleRequestClass [
	self subclassResponsibility
]

{ #category : #initialization }
BrAnchoredModel >> initialize [
	super initialize.
	handle := BlElement new
		size: 10 @ 10;
		padding: (BlInsets all: 5);
		yourself.
	content := BlElement new
]

{ #category : #initialization }
BrAnchoredModel >> initializeListeners [
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
BrAnchoredModel >> notifyContentChanged [
	self
		dispatchEvent:
			(self contentChangedEvent
				content: self content;
				yourself)
]

{ #category : #notifying }
BrAnchoredModel >> notifyHandleChanged [
	self
		dispatchEvent:
			(self handleChangedEvent
				handle: self handle;
				yourself)
]
