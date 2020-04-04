Class {
	#name : #BrCheckboxModel,
	#superclass : #BrStateModel,
	#instVars : [
		'state'
	],
	#category : #'Brick-Checkbox - Model'
}

{ #category : #'api - checkbox' }
BrCheckboxModel >> check [
	self state: BrCheckboxState checked
]

{ #category : #'api - checkbox' }
BrCheckboxModel >> indeterminate [
	self state: BrCheckboxState indeterminate
]

{ #category : #initialization }
BrCheckboxModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrCheckboxRequest reply: [ :aResponse | aResponse state: self state ].
	self when: BrCheckboxWish do: [ :aWish | self state: aWish state ]
]

{ #category : #accessing }
BrCheckboxModel >> state [
	<return: #BrCheckboxState>

	^ state
]

{ #category : #accessing }
BrCheckboxModel >> state: aBrCheckboxState [
	self state = aBrCheckboxState
		ifTrue: [ ^ self ].

	state := aBrCheckboxState.
	self notifyStateChanged: state
]

{ #category : #'state - accessing' }
BrCheckboxModel >> stateChangedEventClass [
	^ BrCheckboxChanged
]

{ #category : #'state - streaming' }
BrCheckboxModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: state
		model: self
]

{ #category : #'api - checkbox' }
BrCheckboxModel >> uncheck [
	self state: BrCheckboxState unchecked
]
