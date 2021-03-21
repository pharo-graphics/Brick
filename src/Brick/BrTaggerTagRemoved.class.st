Class {
	#name : #BrTaggerTagRemoved,
	#superclass : #BrTaggerChangeEvent,
	#instVars : [
		'tag',
		'index'
	],
	#category : #'Brick-Tagger - Events'
}

{ #category : #accessing }
BrTaggerTagRemoved >> index [
	^ index
]

{ #category : #accessing }
BrTaggerTagRemoved >> index: anObject [
	index := anObject
]

{ #category : #accessing }
BrTaggerTagRemoved >> tag [
	^ tag
]

{ #category : #accessing }
BrTaggerTagRemoved >> tag: anObject [
	tag := anObject
]
