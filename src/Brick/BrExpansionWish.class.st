Class {
	#name : #BrExpansionWish,
	#superclass : #BrWish,
	#instVars : [
		'expanded'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #controlling }
BrExpansionWish class >> collapse [
	^ self new expanded: false
]

{ #category : #controlling }
BrExpansionWish class >> expand [
	^ self new expanded: true
]

{ #category : #accessing }
BrExpansionWish >> expanded [
	^ expanded
]

{ #category : #accessing }
BrExpansionWish >> expanded: aBoolean [
	expanded := aBoolean
]

{ #category : #initialization }
BrExpansionWish >> initialize [
	super initialize.
	
	expanded := false
]

{ #category : #testing }
BrExpansionWish >> isExpanded [
	^ expanded
]
