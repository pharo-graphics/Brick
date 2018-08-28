Class {
	#name : #BrPressModel,
	#superclass : #BrStateModel,
	#instVars : [
		'pressed'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrPressModel class >> modelName [
	^ 'Press'
]

{ #category : #'mouse handlers' }
BrPressModel >> dragEndEvent: anEvent [
	anEvent consumed: true.
	self pressed: false
]

{ #category : #'mouse handlers' }
BrPressModel >> dragStartEvent: anEvent [
	anEvent consumed: true.
	self pressed: true
]

{ #category : #initialization }
BrPressModel >> initialize [
	super initialize.
	
	pressed := false
]

{ #category : #initialization }
BrPressModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrPressedRequest reply: [ :aResponse | aResponse pressed: self isPressed ]
]

{ #category : #testing }
BrPressModel >> isPressed [
	^ pressed
]

{ #category : #'mouse handlers' }
BrPressModel >> mouseDownEvent: anEvent [
	anEvent consumed: true.
	self pressed: true
]

{ #category : #'mouse handlers' }
BrPressModel >> mouseUpEvent: anEvent [
	anEvent consumed: true.
	self pressed: false
]

{ #category : #notifying }
BrPressModel >> notifyPressChanged [
	self dispatchEvent: (BrPressedChanged pressed: self isPressed)
]

{ #category : #'private - accessing' }
BrPressModel >> pressed: aBoolean [
	pressed = aBoolean
		ifTrue: [ ^ self ].
		
	pressed := aBoolean.
	self notifyPressChanged
]

{ #category : #printing }
BrPressModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self isPressed asString;
		nextPutAll: ')'
]

{ #category : #streaming }
BrPressModel >> streamStateOn: aStream [
	self isPressed
		ifTrue: [ aStream nextPut: BrPressedState new ]
]
