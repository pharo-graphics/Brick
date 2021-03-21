Class {
	#name : #BrTaggerRemoveTagWish,
	#superclass : #BrTaggerWish,
	#instVars : [
		'tag'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerRemoveTagWish >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerRemoveTagWish >> tag: anObject [
	tag := anObject
]
