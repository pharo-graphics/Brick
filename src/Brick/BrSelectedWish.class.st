Class {
	#name : #BrSelectedWish,
	#superclass : #BrWish,
	#instVars : [
		'selected'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #accessing }
BrSelectedWish class >> selected: aBoolean [
	^ self new selected: aBoolean
]

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
