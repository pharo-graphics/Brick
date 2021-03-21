Class {
	#name : #BrTaggerAddTagWish,
	#superclass : #BrTaggerWish,
	#instVars : [
		'tag'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerAddTagWish >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerAddTagWish >> tag: anObject [
	tag := anObject
]
