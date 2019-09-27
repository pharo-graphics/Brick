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
		assert: [ stateModels noneSatisfy:  [ :eachModel | eachModel class = aStateModel class ] ]
		description: [ 'State model of type ', aStateModel class name, ' already exists!' ].

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

	self when: BrInteractionRequest reply: [ :aResponse | aResponse states: self statesToRoot ]
]

{ #category : #notifying }
BrInteractiveModel >> notifyInteractionChanged [
	| theStates |
	
	theStates := self statesMappingToRoot.
	self dispatchEvent: (BrInteractionChanged new states: theStates values flattened asSet).

	self widgetDo: [ :anElement | anElement childrenDo: [ :eachChild | self notifyStatesChanged: theStates toChildren: eachChild ] ]
]

{ #category : #notifying }
BrInteractiveModel >> notifyStatesChanged: theStates toChildren: anElement [
	| currentStates |

	currentStates := theStates.

	"If an element has a state model of the same type we stop propagation of the notification,
	because such widgets are no longer within my state context"
	anElement viewModelDo: [ :aViewModel |
		aViewModel
			findActor: self class
			ifFound: [ :anIteractiveModel | currentStates addAll: anIteractiveModel statesMapping ] ].

	anElement dispatchEvent: (BrInteractionChanged new states: theStates values flattened asSet).
	anElement childrenDo: [ :eachChild | self notifyStatesChanged: currentStates copy toChildren: eachChild ]
]

{ #category : #'api - states' }
BrInteractiveModel >> stateModels [
	^ stateModels
]

{ #category : #'private - states' }
BrInteractiveModel >> statesMapping [
	<return: #Dictionary key: #'BrStateModel class' value: #BrInteractionState>

	^ (self stateModels collect: [ :aStateModel | aStateModel class -> (Array streamContents: [ :aStream | aStateModel streamStateOn: aStream ]) ]) asDictionary
]

{ #category : #'private - states' }
BrInteractiveModel >> statesMappingToRoot [
	<return: #Dictionary key: #'BrStateModel class' value: #BrInteractionState>
	| aParentChain theStates |
	
	self isAttachedToWidget
		ifFalse: [ ^ self statesMapping ].
	
	aParentChain := BlParentChain new.
	self widgetDo: [ :aWidget | aParentChain := BlParentChain of: aWidget ].
	
	theStates := Dictionary new.
	
	aParentChain do: [ :eachElement |
		eachElement viewModelDo: [ :aViewModel | aViewModel findActor: self class ifFound: [ :eachInteractionModel |
			theStates addAll: eachInteractionModel statesMapping ] ] ].

	^ theStates
]

{ #category : #'private - states' }
BrInteractiveModel >> statesToRoot [
	<return: #Set of: #BrInteractionState>
	
	^ self statesMappingToRoot values flattened asSet
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
