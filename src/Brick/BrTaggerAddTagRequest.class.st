Class {
	#name : #BrTaggerAddTagRequest,
	#superclass : #BrTaggerRequest,
	#instVars : [
		'tag'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerAddTagRequest >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerAddTagRequest >> tag: anObject [
	tag := anObject
]
