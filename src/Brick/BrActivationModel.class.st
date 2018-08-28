Class {
	#name : #BrActivationModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'enabled'
	],
	#category : 'Brick-! Core'
}

{ #category : #'instance creation' }
BrActivationModel class >> disabled [
	^ self new disabled: true
]

{ #category : #'instance creation' }
BrActivationModel class >> enabled [
	^ self new enabled: true
]

{ #category : #printing }
BrActivationModel class >> modelName [
	^ 'Activation'
]

{ #category : #'api - activation' }
BrActivationModel >> disable [
	self isDisabled
		ifTrue: [ ^ self ].

	enabled := false.
	self notifyActivationChanged
]

{ #category : #'api - activation' }
BrActivationModel >> disabled: aBoolean [
	aBoolean
		ifTrue: [ self disable ]
		ifFalse: [ self enable ]
]

{ #category : #'api - activation' }
BrActivationModel >> enable [
	self isEnabled
		ifTrue: [ ^ self ].

	enabled := true.
	self notifyActivationChanged
]

{ #category : #'api - activation' }
BrActivationModel >> enabled: aBoolean [
	aBoolean
		ifTrue: [ self enable ]
		ifFalse: [ self disable ]
]

{ #category : #initialization }
BrActivationModel >> initialize [
	super initialize.
	
	enabled := true
]

{ #category : #hooks }
BrActivationModel >> initializeListeners [
	super initializeListeners.

	self when: BrActivationRequest reply: [ :aResponse | aResponse enabled: self isEnabled ]
]

{ #category : #'api - testing' }
BrActivationModel >> isDisabled [
	<return: #Boolean>

	^ self isEnabled not
]

{ #category : #'api - testing' }
BrActivationModel >> isEnabled [
	<return: #Boolean>

	^ enabled
]

{ #category : #notifying }
BrActivationModel >> notifyActivationChanged [
	self dispatchEvent: (BrActivationChanged enabled: self isEnabled)
]

{ #category : #printing }
BrActivationModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: (self isEnabled ifTrue: [ 'enabled' ] ifFalse: [ 'disabled' ]);
		nextPutAll: ')'
]
