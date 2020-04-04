Class {
	#name : #BrSwitchModel,
	#superclass : #BrStateModel,
	#instVars : [
		'switchedOn'
	],
	#category : #'Brick-Switch - Model'
}

{ #category : #initialization }
BrSwitchModel >> initialize [
	super initialize.

	switchedOn := false
]

{ #category : #initialization }
BrSwitchModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrSwitchRequest reply: [ :aResponse | aResponse switchedOn: self isOn ].
	self when: BrSwitchWish do: [ :aWish | self switch: aWish isOn ]
]

{ #category : #testing }
BrSwitchModel >> isOff [
	<return: #Boolean>
	
	^ switchedOn not
]

{ #category : #testing }
BrSwitchModel >> isOn [
	<return: #Boolean>

	^ switchedOn
]

{ #category : #'state - accessing' }
BrSwitchModel >> stateChangedEventClass [
	^ BrSwitchChanged
]

{ #category : #'state - streaming' }
BrSwitchModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (self isOn 
			ifTrue: [ BrSwitchedOnState new ]
			ifFalse: [ BrSwitchedOffState new ])
		model: self
]

{ #category : #'api - switch' }
BrSwitchModel >> switch: aBoolean [
	aBoolean
		ifTrue: [ self switchOn ]
		ifFalse: [ self switchOff ]
]

{ #category : #'api - switch' }
BrSwitchModel >> switchOff [
	self isOff
		ifTrue: [ ^ self ].
		
	switchedOn := false.
	self notifyStateChanged: switchedOn
]

{ #category : #'api - switch' }
BrSwitchModel >> switchOn [
	self isOn
		ifTrue: [ ^ self ].
		
	switchedOn := true.
	self notifyStateChanged: switchedOn
]

{ #category : #'api - switch' }
BrSwitchModel >> toggle [
	self switch: self isOn not
]
