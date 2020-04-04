Class {
	#name : #BrEnablementModel,
	#superclass : #BrStateModel,
	#instVars : [
		'enabled'
	],
	#category : #'Brick-! Core'
}

{ #category : #'instance creation' }
BrEnablementModel class >> disabled [
	^ self new disabled: true
]

{ #category : #'instance creation' }
BrEnablementModel class >> enabled [
	^ self new enabled: true
]

{ #category : #printing }
BrEnablementModel class >> modelName [
	^ 'Activation'
]

{ #category : #'api - activation' }
BrEnablementModel >> disable [
	self isDisabled
		ifTrue: [ ^ self ].

	enabled := false.
	self notifyStateChanged: self isEnabled
]

{ #category : #'api - activation' }
BrEnablementModel >> disabled: aBoolean [
	aBoolean
		ifTrue: [ self disable ]
		ifFalse: [ self enable ]
]

{ #category : #'api - activation' }
BrEnablementModel >> enable [
	self isEnabled
		ifTrue: [ ^ self ].

	enabled := true.
	self notifyStateChanged: self isEnabled
]

{ #category : #'api - activation' }
BrEnablementModel >> enabled: aBoolean [
	aBoolean
		ifTrue: [ self enable ]
		ifFalse: [ self disable ]
]

{ #category : #initialization }
BrEnablementModel >> initialize [
	super initialize.
	
	enabled := true
]

{ #category : #initialization }
BrEnablementModel >> initializeListeners [
	super initializeListeners.

	self when: BrEnablementRequest reply: [ :aResponse | aResponse enabled: self isEnabled ].
	self when: BrEnablementWish do: [ :aWish | self enabled: aWish isEnabled ]
]

{ #category : #'api - testing' }
BrEnablementModel >> isDisabled [
	<return: #Boolean>

	^ self isEnabled not
]

{ #category : #'api - testing' }
BrEnablementModel >> isEnabled [
	<return: #Boolean>

	^ enabled
]

{ #category : #printing }
BrEnablementModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: (self isEnabled ifTrue: [ 'enabled' ] ifFalse: [ 'disabled' ]);
		nextPutAll: ')'
]

{ #category : #notifying }
BrEnablementModel >> stateChangedEventClass [
	^ BrEnablementChanged
]

{ #category : #streaming }
BrEnablementModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (self isEnabled
			ifTrue: [ BrDisabledState new not ]
			ifFalse: [ BrDisabledState new ])
		model: self
]

{ #category : #'api - activation' }
BrEnablementModel >> toggle [
	self enabled: self isEnabled not
]
