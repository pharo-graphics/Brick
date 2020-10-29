Class {
	#name : #BrTaggerAllowedExplicitTags,
	#superclass : #BrTaggerAllowedTags,
	#instVars : [
		'tags'
	],
	#category : #'Brick-Tagger - Model'
}

{ #category : #accessing }
BrTaggerAllowedExplicitTags >> tags [
	^ tags
]

{ #category : #accessing }
BrTaggerAllowedExplicitTags >> tags: anObject [
	tags := anObject
]
