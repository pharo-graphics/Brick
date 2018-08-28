Class {
	#name : #BrInteractionLook,
	#superclass : #BrLook,
	#instVars : [
		'conditions'
	],
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrInteractionLook >> buildConditionsOn: aBuilder [
	
]

{ #category : #'api - conditions' }
BrInteractionLook >> define: aBlock [
	| aBuilder |
	aBuilder := BrInteractionStateBuilder new.
	aBlock value: aBuilder.

	conditions addAll: aBuilder conditions
]

{ #category : #initialization }
BrInteractionLook >> initialize [
	super initialize.
	
	conditions := OrderedCollection new
]

{ #category : #initialization }
BrInteractionLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrInteractionChanged do: [ :anEvent | self interactionChanged: anEvent ]
]

{ #category : #initialization }
BrInteractionLook >> initializeLook [
	| builder |
	super initializeLook.
	
	builder := BrInteractionStateBuilder new.
	self buildConditionsOn: builder.
	
	conditions addAllFirst: builder conditions
]

{ #category : #initialization }
BrInteractionLook >> initializeRequests [
	super initializeRequests.
	
	self interactionChanged: (self request: BrInteractionRequest oneWay)
]

{ #category : #hooks }
BrInteractionLook >> interactionChanged: anEvent [

	conditions
		select: [ :aCondition | aCondition state matches: anEvent states ]
		thenDo: [ :aCondition | aCondition action cull: self widget ]
]
