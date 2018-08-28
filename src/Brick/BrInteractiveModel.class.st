"
I am a composite interaction model responsible for managing widget state such as pressed, hovered, focused.
"
Class {
	#name : #BrInteractiveModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'pressModel',
		'hoverModel',
		'activationModel'
	],
	#category : #'Brick-! Core'
}

{ #category : #'api - activation' }
BrInteractiveModel >> disable [
	activationModel disable
]

{ #category : #'api - activation' }
BrInteractiveModel >> enable [
	activationModel enable
]

{ #category : #'api - activation' }
BrInteractiveModel >> enabled: aBoolean [
	activationModel enabled: aBoolean
]

{ #category : #initialization }
BrInteractiveModel >> initialize [
	super initialize.
	
	self addAll: { 
		pressModel := BrPressModel new.
		hoverModel := BrHoverModel new.
		activationModel := BrActivationModel new
	}
]

{ #category : #initialization }
BrInteractiveModel >> initializeListeners [
	super initializeListeners.

	self when: BrInteractionRequest reply: [ :aResponse | aResponse states: self states ].
	self when: BrPressedChanged do: [ self notifyInteractionChanged ].
	self when: BrHoveredChanged do: [ self notifyInteractionChanged ].
	self when: BrActivationChanged do: [ self notifyInteractionChanged ].
]

{ #category : #testing }
BrInteractiveModel >> isDisabled [
	^ activationModel isDisabled
]

{ #category : #testing }
BrInteractiveModel >> isEnabled [
	^ activationModel isEnabled
]

{ #category : #testing }
BrInteractiveModel >> isHovered [
	^ hoverModel isHovered
]

{ #category : #testing }
BrInteractiveModel >> isPressed [
	^ pressModel isPressed
]

{ #category : #notifying }
BrInteractiveModel >> notifyInteractionChanged [
	self dispatchEvent: (BrInteractionChanged new states: self states)
]

{ #category : #accessing }
BrInteractiveModel >> stateModels [
	^ self widgetModels
]

{ #category : #accessing }
BrInteractiveModel >> states [
	^ (Array streamContents: [ :aStream |
		self stateModels do: [ :aStateModel | aStateModel streamStateOn: aStream ]
	]) asSet
]
