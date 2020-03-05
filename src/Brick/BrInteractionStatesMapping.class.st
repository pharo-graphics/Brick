Class {
	#name : #BrInteractionStatesMapping,
	#superclass : #Object,
	#instVars : [
		'mapping'
	],
	#category : #'Brick-! Core - States'
}

{ #category : #adding }
BrInteractionStatesMapping >> addState: aBrInteractiveState model: aBrStateModel [
	mapping
		at: aBrStateModel class
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

{ #category : #initialization }
BrInteractionStatesMapping >> initialize [
	super initialize.
	
	mapping := IdentityDictionary new
]

{ #category : #accessing }
BrInteractionStatesMapping >> states [
	<return: #Set of: #BrInteractionState>
	| aSet |
	
	aSet := Set new.
	mapping valuesDo: [ :eachModelStates | aSet add: eachModelStates ].
	^ aSet
]
