Class {
	#name : #BrTaggerTagsRequest,
	#superclass : #BrTaggerRequest,
	#category : #'Brick-Tagger - Events'
}

{ #category : #initialization }
BrTaggerTagsRequest >> responseClass [
	^ BrTaggerTagsChanged
]
