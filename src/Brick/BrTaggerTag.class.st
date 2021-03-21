Class {
	#name : #BrTaggerTag,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Brick-Tagger - Model'
}

{ #category : #'instance creation' }
BrTaggerTag class >> named: aString [
	^ self new name: aString
]

{ #category : #accessing }
BrTaggerTag >> name [
	^ name
]

{ #category : #accessing }
BrTaggerTag >> name: anObject [
	name := anObject
]
