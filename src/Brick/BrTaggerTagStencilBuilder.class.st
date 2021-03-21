Class {
	#name : #BrTaggerTagStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'tag'
	],
	#category : #'Brick-Tagger - Model'
}

{ #category : #'api - instantiation' }
BrTaggerTagStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
]

{ #category : #'api - instantiation' }
BrTaggerTagStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor push: self tag
]

{ #category : #accessing }
BrTaggerTagStencilBuilder >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerTagStencilBuilder >> tag: anObject [
	tag := anObject
]
