Class {
	#name : #BrTaggerTagRenamed,
	#superclass : #BrTaggerChangeEvent,
	#instVars : [
		'tag',
		'newName',
		'oldName'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerTagRenamed >> newName [
	^ newName
]

{ #category : #accessing }
BrTaggerTagRenamed >> newName: anObject [
	newName := anObject
]

{ #category : #accessing }
BrTaggerTagRenamed >> oldName [
	^ oldName
]

{ #category : #accessing }
BrTaggerTagRenamed >> oldName: anObject [
	oldName := anObject
]

{ #category : #accessing }
BrTaggerTagRenamed >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerTagRenamed >> tag: anObject [
	tag := anObject
]
