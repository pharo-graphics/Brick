Class {
	#name : #BrHoveredChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'hovered'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrHoveredChanged class >> hovered: aBoolean [
	^ self new hovered: aBoolean
]

{ #category : #accessing }
BrHoveredChanged >> hovered [
	^ hovered
]

{ #category : #accessing }
BrHoveredChanged >> hovered: aBoolean [
	hovered := aBoolean
]

{ #category : #initialization }
BrHoveredChanged >> initialize [
	super initialize.
	
	hovered := false
]

{ #category : #testing }
BrHoveredChanged >> isHovered [
	^ self hovered
]

{ #category : #accessing }
BrHoveredChanged >> state: anObject [
	"Override me to properly set the given state"

	self hovered: anObject
]
