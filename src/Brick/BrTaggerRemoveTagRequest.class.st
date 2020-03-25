Class {
	#name : #BrTaggerRemoveTagRequest,
	#superclass : #BrTaggerRequest,
	#instVars : [
		'tag'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerRemoveTagRequest >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerRemoveTagRequest >> tag: anObject [
	tag := anObject
]
