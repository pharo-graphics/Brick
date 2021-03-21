Class {
	#name : #BrTaggerRenameTagWish,
	#superclass : #BrTaggerWish,
	#instVars : [
		'tag',
		'newName'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerRenameTagWish >> newName [
	^ newName
]

{ #category : #accessing }
BrTaggerRenameTagWish >> newName: anObject [
	newName := anObject
]

{ #category : #accessing }
BrTaggerRenameTagWish >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerRenameTagWish >> tag: anObject [
	tag := anObject
]
