Class {
	#name : #BrTaggerAllowedTagsRequest,
	#superclass : #BrTaggerRequest,
	#category : #'Brick-Tagger - Events'
}

{ #category : #initialization }
BrTaggerAllowedTagsRequest >> responseClass [
	^ BrTaggerAllowedTagsChanged
]
