Class {
	#name : #BrContextMenuVisibleChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'visible'
	],
	#category : #'Brick-Context Menu - Events'
}

{ #category : #accessing }
BrContextMenuVisibleChanged >> visible [
	^ visible
]

{ #category : #accessing }
BrContextMenuVisibleChanged >> visible: anObject [
	visible := anObject
]
