Class {
	#name : #BrSelectedWish,
	#superclass : #BrWish,
	#instVars : [
		'selected'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrSelectedWish >> initialize [
	super initialize.
	
	selected := false
]

{ #category : #accessing }
BrSelectedWish >> isSelected [
	^ self selected
]

{ #category : #accessing }
BrSelectedWish >> selected [
	^ selected
]

{ #category : #accessing }
BrSelectedWish >> selected: anObject [
	selected := anObject
]
