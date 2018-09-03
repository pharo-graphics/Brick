"
I am a composite interaction model responsible for managing widget state such as pressed, hovered, focused.
"
Class {
	#name : #BrInteractiveModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'stateModels'
	],
	#category : #'Brick-! Core'
}

{ #category : #'api - states' }
BrInteractiveModel >> addState: aStateModel [
	"Add a given state model as my sub-model and register corresponding update events"

	stateModels add: aStateModel.
	self when: aStateModel stateChangedEventClass do: [ self notifyInteractionChanged ].
	self add: aStateModel
]

{ #category : #'api - states' }
BrInteractiveModel >> addStates: aCollectionOfStateModels [
	aCollectionOfStateModels do: [ :aStateModel | self addState: aStateModel ]
]

{ #category : #initialization }
BrInteractiveModel >> initialize [
	super initialize.
	
	stateModels := OrderedCollection new
]

{ #category : #initialization }
BrInteractiveModel >> initializeListeners [
	super initializeListeners.

	self when: BrInteractionRequest reply: [ :aResponse | aResponse states: self states ]
]

{ #category : #notifying }
BrInteractiveModel >> notifyInteractionChanged [
	self dispatchEvent: (BrInteractionChanged new states: self states)
]

{ #category : #'api - states' }
BrInteractiveModel >> stateModels [
	^ stateModels
]

{ #category : #'api - states' }
BrInteractiveModel >> states [
	^ (Array streamContents: [ :aStream |
		self stateModels do: [ :aStateModel | aStateModel streamStateOn: aStream ]
	]) asSet
]

{ #category : #'api - interactions' }
BrInteractiveModel >> withActivation [
	self addState: BrActivationModel new
]

{ #category : #'api - interactions' }
BrInteractiveModel >> withExpansion [
	self addState: BrExpandableModel new
]

{ #category : #'api - interactions' }
BrInteractiveModel >> withFocus [
	self addState: BrFocusModel new
]

{ #category : #'api - interactions' }
BrInteractiveModel >> withHover [
	self addState: BrHoverModel new
]

{ #category : #'api - interactions' }
BrInteractiveModel >> withPress [
	self addState: BrPressModel new
]
