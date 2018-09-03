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

{ #category : #testing }
BrExpansionChanged >> isCollapsed [
	^ self expanded not
]

{ #category : #testing }
BrExpansionChanged >> isExpanded [
	^ self expanded
]

{ #category : #accessing }
BrExpansionChanged >> state: anObject [
	"Override me to properly set the given state"

	self expanded: anObject
]
