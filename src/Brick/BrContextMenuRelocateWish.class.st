Class {
	#name : #BrContextMenuRelocateWish,
	#superclass : #BrWish,
	#instVars : [
		'position',
		'anchor',
		'container'
	],
	#category : #'Brick-Context Menu - Events'
}

{ #category : #'as yet unclassified' }
BrContextMenuRelocateWish class >> position: aPoint anchor: anElement container: anotherElement [
	^ self new
		position: aPoint;
		anchor: anElement;
		container: anotherElement;
		yourself
]

{ #category : #accessing }
BrContextMenuRelocateWish >> anchor [
	^ anchor
]

{ #category : #accessing }
BrContextMenuRelocateWish >> anchor: anObject [
	anchor := anObject
]

{ #category : #accessing }
BrContextMenuRelocateWish >> container [
	^ container
]

{ #category : #accessing }
BrContextMenuRelocateWish >> container: anObject [
	container := anObject
]

{ #category : #accessing }
BrContextMenuRelocateWish >> position [
	^ position
]

{ #category : #accessing }
BrContextMenuRelocateWish >> position: anObject [
	position := anObject
]
