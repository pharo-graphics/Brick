"
I am a composite interaction model responsible for managing widget state such as pressed, hovered, focused.


"
Class {
	#name : #BrInteractionModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'pressModel',
		'hoverModel',
		'activationModel'
	],
	#category : #'Brick-! Core'
}

{ #category : #'api - activation' }
BrInteractionModel >> disable [
	activationModel disable
]

{ #category : #'api - activation' }
BrInteractionModel >> enable [
	activationModel enable
]

{ #category : #'api - activation' }
BrInteractionModel >> enabled: aBoolean [
	activationModel enabled: aBoolean
]

{ #category : #initialization }
BrInteractionModel >> initialize [
	super initialize.
	
	self addAll: { 
		pressModel := BrPressModel new.
		hoverModel := BrHoverModel new.
		activationModel := BrActivationModel new
	}
]

{ #category : #initialization }
BrInteractionModel >> initializeListeners [
	super initializeListeners.

	self when: BrInteractionRequest reply: [ :aResponse | aResponse states: self states ].
	self when: BrPressedChanged do: [ self notifyInteractionChanged ].
	self when: BrHoveredChanged do: [ self notifyInteractionChanged ].
	self when: BrActivationChanged do: [ self notifyInteractionChanged ].
]

{ #category : #testing }
BrInteractionModel >> isDisabled [
	^ activationModel isDisabled
]

{ #category : #testing }
BrInteractionModel >> isEnabled [
	^ activationModel isEnabled
]

{ #category : #testing }
BrInteractionModel >> isHovered [
	^ hoverModel isHovered
]

{ #category : #testing }
BrInteractionModel >> isPressed [
	^ pressModel isPressed
]

{ #category : #notifying }
BrInteractionModel >> notifyInteractionChanged [
	self dispatchEvent: (BrInteractionChanged new states: self states)
]

{ #category : #accessing }
BrInteractionModel >> stateModels [
	^ self widgetModels
]

{ #category : #accessing }
BrInteractionModel >> states [
	^ (Array streamContents: [ :aStream |
		self stateModels do: [ :aStateModel | aStateModel streamStateOn: aStream ]
	]) asSet
]
