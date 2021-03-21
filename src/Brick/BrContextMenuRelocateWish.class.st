Class {
	#name : #BrContextMenuRelocateWish,
	#superclass : #BrAnchoredRelocateWish,
	#instVars : [
		'position'
	],
	#category : #'Brick-Context Menu - Events'
}

{ #category : #converting }
BrContextMenuRelocateWish >> asRelocation [
	^ self position
]

{ #category : #accessing }
BrContextMenuRelocateWish >> position [
	^ position
]

{ #category : #accessing }
BrContextMenuRelocateWish >> position: anObject [
	position := anObject
]
