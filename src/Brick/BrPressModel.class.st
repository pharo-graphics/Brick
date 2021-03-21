Class {
	#name : #BrPressModel,
	#superclass : #BrStateModel,
	#instVars : [
		'pressed'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrPressModel class >> isDeprecated [
	^ true
]

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
	
	self when: BrPressedRequest reply: [ :aResponse | aResponse pressed: self isPressed ].
	self when: BlDragEndEvent do: [ :anEvent | self dragEndEvent: anEvent ].
	self when: BlDragStartEvent do: [ :anEvent | self dragStartEvent: anEvent ].
	self when: BlMouseDownEvent do: [ :anEvent | self mouseDownEvent: anEvent ].
	self when: BlMouseUpEvent do: [ :anEvent | self mouseUpEvent: anEvent ]
]

{ #category : #'api - testing' }
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

{ #category : #'private - accessing' }
BrPressModel >> pressed: aBoolean [
	pressed = aBoolean
		ifTrue: [ ^ self ].
		
	pressed := aBoolean.
	self notifyStateChanged: pressed
]

{ #category : #printing }
BrPressModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self isPressed asString;
		nextPutAll: ')'
]

{ #category : #streaming }
BrPressModel >> stateChangedEventClass [
	^ BrPressedChanged
]

{ #category : #streaming }
BrPressModel >> streamStateIn: aBrInteractionStatesMapping [
	self isPressed
		ifTrue: [ aBrInteractionStatesMapping addState: BrPressedState new model: self ]
]
