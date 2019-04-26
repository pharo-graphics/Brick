Class {
	#name : #BrSelectModel,
	#superclass : #BrStateModel,
	#instVars : [
		'selected'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrSelectModel class >> modelName [
	^ 'Select'
]

{ #category : #'api - selection' }
BrSelectModel >> deselect [
	self isSelected
		ifFalse: [ ^ self ].

	selected := false.
	self notifyStateChanged: selected
]

{ #category : #initialization }
BrSelectModel >> initialize [
	super initialize.
	
	selected := false
]

{ #category : #initialization }
BrSelectModel >> initializeListeners [
	super initializeListeners.

	self when: BrSelectedStateRequest reply: [ :aResponse | aResponse selected: self isSelected ].
	self when: BrSelectedWish do: [ :aWish | self selected: aWish isSelected ]
]

{ #category : #'api - selection' }
BrSelectModel >> isSelected [
	<return: #Boolean>

	^ selected
]

{ #category : #'api - selection' }
BrSelectModel >> select [
	self isSelected
		ifTrue: [ ^ self ].

	selected := true.
	self notifyStateChanged: selected
]

{ #category : #'api - selection' }
BrSelectModel >> selected: aBoolean [
	aBoolean
		ifTrue: [ self select ]
		ifFalse: [ self deselect ]
]

{ #category : #'state - accessing' }
BrSelectModel >> stateChangedEventClass [
	^ BrSelectedChanged
]

{ #category : #'state - streaming' }
BrSelectModel >> streamStateOn: aStream [
	aStream nextPut: (self isSelected
		ifTrue: [ BrSelectedState new ]
		ifFalse: [ BrSelectedState new not ])
]

{ #category : #'api - selection' }
BrSelectModel >> toggle [
	self isSelected
		ifTrue: [ self deselect ]
		ifFalse: [ self select ]
]
