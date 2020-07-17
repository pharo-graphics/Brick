"
I am sent by ${class:BrExpandableModel}$ when its expansion state changes.
I am also a respose to the ${class:BrExpansionStateRequest}$
"
Class {
	#name : #BrExpansionChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'expanded'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrExpansionChanged class >> expanded: aBoolean [
	^ self new expanded: aBoolean
]

{ #category : #accessing }
BrExpansionChanged >> expanded [
	<return: #Boolean>

	^ expanded
]

{ #category : #accessing }
BrExpansionChanged >> expanded: aBoolean [
	expanded := aBoolean
]

{ #category : #initialization }
BrExpansionChanged >> initialize [
	super initialize.
	
	expanded := false
]

{ #category : #testing }
BrExpansionChanged >> isCollapsed [
	^ self expanded not
]

{ #category : #testing }
BrExpansionChanged >> isExpanded [
	^ self expanded
]

{ #category : #accessing }
BrExpansionChanged >> state: aBoolean [
	"Override me to properly set the given state"

	self expanded: aBoolean
]
