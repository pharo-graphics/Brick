Class {
	#name : #BrTaggerTagsChanged,
	#superclass : #BrTaggerChangeEvent,
	#instVars : [
		'tags'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #initialization }
BrTaggerTagsChanged >> initialize [
	super initialize.
	
	tags := #()
]

{ #category : #accessing }
BrTaggerTagsChanged >> tags [
	^ tags
]

{ #category : #accessing }
BrTaggerTagsChanged >> tags: anObject [
	tags := anObject
]
