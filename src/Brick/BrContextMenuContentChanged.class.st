Class {
	#name : #BrContextMenuContentChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'content'
	],
	#category : #'Brick-Context Menu - Events'
}

{ #category : #accessing }
BrContextMenuContentChanged >> content [
	^ content
]

{ #category : #accessing }
BrContextMenuContentChanged >> content: anObject [
	content := anObject
]
