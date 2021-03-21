Class {
	#name : #BrTaggerAllowedTagsChanged,
	#superclass : #BrTaggerChangeEvent,
	#instVars : [
		'allowedTags'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerAllowedTagsChanged >> allowedTags [
	^ allowedTags
]

{ #category : #accessing }
BrTaggerAllowedTagsChanged >> allowedTags: anObject [
	allowedTags := anObject
]
