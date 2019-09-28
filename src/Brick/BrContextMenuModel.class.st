Class {
	#name : #BrContextMenuModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'content',
		'handle'
	],
	#category : #'Brick-Context Menu - Model'
}

{ #category : #printing }
BrContextMenuModel class >> modelName [
	^ 'Label'
]

{ #category : #'instance creation' }
BrContextMenuModel class >> text: aStringOrText [
	^ self new text: aStringOrText
]

{ #category : #accessing }
BrContextMenuModel >> content [
	^ content
]

{ #category : #accessing }
BrContextMenuModel >> content: anObject [
	content = anObject
		ifTrue: [ ^ self ].
	content := anObject.
	self notifyContentChanged
]

{ #category : #accessing }
BrContextMenuModel >> handle [
	^ handle
]

{ #category : #accessing }
BrContextMenuModel >> handle: anObject [
	handle = anObject
		ifTrue: [ ^ self ].
	handle := anObject.
	self notifyHandleChanged
]

{ #category : #initialization }
BrContextMenuModel >> initialize [
	super initialize.
	handle := BlElement new
		size: 10 @ 10;
		padding: (BlInsets all: 5);
		yourself.
	content := BlElement new
]

{ #category : #initialization }
BrContextMenuModel >> initializeListeners [
	super initializeListeners.
	self
		when: BrContextMenuContentRequest
			reply: [ :e | e content: self content ];
		when: BrContextMenuHandleRequest
			reply: [ :e | e handle: self handle ]
]

{ #category : #notifying }
BrContextMenuModel >> notifyContentChanged [
	self
		dispatchEvent:
			(BrContextMenuContentChanged new
				content: self content;
				yourself)
]

{ #category : #notifying }
BrContextMenuModel >> notifyHandleChanged [
	self
		dispatchEvent:
			(BrContextMenuHandleChanged new
				handle: self handle;
				yourself)
]
