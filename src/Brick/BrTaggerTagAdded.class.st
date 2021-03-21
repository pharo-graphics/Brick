Class {
	#name : #BrTaggerTagAdded,
	#superclass : #BrTaggerChangeEvent,
	#instVars : [
		'tag',
		'index'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerTagAdded >> index [
	^ index
]

{ #category : #accessing }
BrTaggerTagAdded >> index: anObject [
	index := anObject
]

{ #category : #accessing }
BrTaggerTagAdded >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerTagAdded >> tag: anObject [
	tag := anObject
]
