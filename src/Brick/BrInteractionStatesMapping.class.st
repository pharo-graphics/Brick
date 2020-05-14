Class {
	#name : #BrInteractionStatesMapping,
	#superclass : #Object,
	#instVars : [
		'mapping'
	],
	#category : #'Brick-! Core - States'
}

{ #category : #comparing }
BrInteractionStatesMapping >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ mapping = anObject mapping
]

{ #category : #adding }
BrInteractionStatesMapping >> addState: aBrInteractiveState model: aBrStateModel [
	self
		addState: aBrInteractiveState
		modelClass: aBrStateModel class
]

{ #category : #adding }
BrInteractionStatesMapping >> addState: aBrInteractiveState modelClass: aBrStateModelClass [
	mapping
		at: aBrStateModelClass
		put: aBrInteractiveState
]

{ #category : #'gt-extension' }
BrInteractionStatesMapping >> gtStatesFor: aView [
	<gtView>

	mapping
		ifEmpty: [ ^ aView empty ].
	
	^ aView forward
		priority: 1;
		title: 'States';
		object: [ mapping ];
		view: #gtItemsFor:
]

{ #category : #comparing }
BrInteractionStatesMapping >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ mapping hash
]

{ #category : #initialization }
BrInteractionStatesMapping >> initialize [
	super initialize.
	
	mapping := IdentityDictionary new
]

{ #category : #testing }
BrInteractionStatesMapping >> isEmpty [
	<return: #Boolean>

	^ mapping isEmpty
]

{ #category : #accessing }
BrInteractionStatesMapping >> mapping [
	^ mapping
]

{ #category : #accessing }
BrInteractionStatesMapping >> mappingToPropagateToChildren [
	<return: #Set of: #BrInteractionState>
	| aNewMapping |
	
	aNewMapping := self class new.
	
	mapping keysAndValuesDo: [ :eachModelClass :eachModelState |
		eachModelClass canPropagateToChildren
			ifTrue: [ aNewMapping addState: eachModelState modelClass: eachModelClass ] ].
		
	^ aNewMapping
]

{ #category : #accessing }
BrInteractionStatesMapping >> states [
	<return: #Set of: #BrInteractionState>
	| aSet |
	
	aSet := Set new.
	mapping valuesDo: [ :eachModelStates | aSet add: eachModelStates ].
	^ aSet
]

{ #category : #accessing }
BrInteractionStatesMapping >> statesToPropagateToChildren [
	<return: #Set of: #BrInteractionState>
	| aSet |
	
	aSet := Set new.
	mapping keysAndValuesDo: [ :eachModelClass :eachModelStates |
		eachModelClass canPropagateToChildren
			ifTrue: [ aSet add: eachModelStates ] ].
	^ aSet
]
