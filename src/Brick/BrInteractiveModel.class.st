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

{ #category : #'instance creation' }
BrInteractiveModel class >> with: aStateModel [
	^ self new addState: aStateModel
]

{ #category : #'instance creation' }
BrInteractiveModel class >> withAll: aCollecitonOfStateModels [
	^ self new addStates: aCollecitonOfStateModels
]

{ #category : #'api - states' }
BrInteractiveModel >> addState: aStateModel [
	"Add a given state model as my sub-model and register corresponding update events"

	self
		assert: [ stateModels noneSatisfy: [ :eachModel | eachModel class = aStateModel class ] ]
		description: [ 'State model of type ', aStateModel class name, ' already exists!' ].

	stateModels add: aStateModel.
	self when: aStateModel stateChangedEventClass do: [ self notifyInteractionChanged ].
	self add: aStateModel
]

{ #category : #'api - states' }
BrInteractiveModel >> addStates: aCollectionOfStateModels [
	aCollectionOfStateModels do: [ :aStateModel | self addState: aStateModel ]
]

{ #category : #'gt-extension' }
BrInteractiveModel >> gtLocalStatesFor: aView [
	<gtView>
	
	^ aView forward
		priority: 1;
		title: 'Local States';
		object: [ self statesMapping ];
		view: #gtStatesFor:
]

{ #category : #initialization }
BrInteractiveModel >> initialize [
	super initialize.
	
	stateModels := OrderedCollection new
]

{ #category : #initialization }
BrInteractiveModel >> initializeListeners [
	super initializeListeners.

	self when: BrInteractionRequest reply: [ :aResponse :aRequest |
		aResponse
			states: self statesMapping states;
			forceUpdate: aRequest forceUpdate ]
]

{ #category : #notifying }
BrInteractiveModel >> notifyInteractionChanged [
	| theStatesMapping theStates |

	theStatesMapping := self statesMapping.
	theStates := theStatesMapping states.
	self dispatchEvent: (BrInteractionChanged new states: theStates).

	self widgetDo: [ :anElement | anElement childrenDo: [ :eachChild | self notifyStatesChanged: theStates toChildren: eachChild ] ]
]

{ #category : #notifying }
BrInteractiveModel >> notifyStatesChanged: aSetOfStates toChildren: anElement [
	"If an element has a state model of the same type we stop propagation of the notification,
	because such widgets are no longer within my state context"

	anElement viewModelDo: [ :aViewModel |
		aViewModel
			findActor: self class
			ifFound: [ :anIteractiveModel | ^ self ] ].

	"no need to dispatch an event if there is no look"
	anElement lookDo: [ :aLook | anElement dispatchEvent: (BrInteractionChanged new states: aSetOfStates) ].
	anElement childrenDo: [ :eachChild | self notifyStatesChanged: aSetOfStates toChildren: eachChild ]
]

{ #category : #'api - states' }
BrInteractiveModel >> stateModels [
	^ stateModels
]

{ #category : #'private - states' }
BrInteractiveModel >> statesMapping [
	<return: #BrInteractionStatesMapping>

	^ self statesMappingIn: BrInteractionStatesMapping new
]

{ #category : #'private - states' }
BrInteractiveModel >> statesMappingIn: aStatesMapping [
	<return: #BrInteractionStatesMapping>

	self stateModels do: [ :aStateModel | aStateModel streamStateIn: aStatesMapping ].

	^ aStatesMapping
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
