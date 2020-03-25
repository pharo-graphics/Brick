Class {
	#name : #BrTaggerRenameTagRequest,
	#superclass : #BrTaggerRequest,
	#instVars : [
		'tag',
		'newName'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerRenameTagRequest >> newName [
	^ newName
]

{ #category : #accessing }
BrTaggerRenameTagRequest >> newName: anObject [
	newName := anObject
]

{ #category : #accessing }
BrTaggerRenameTagRequest >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerRenameTagRequest >> tag: anObject [
	tag := anObject
]
