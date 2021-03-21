Class {
	#name : #BrColumnsChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'columns'
	],
	#category : #'Brick-Column - Events'
}

{ #category : #accessing }
BrColumnsChanged >> columns [
	^ columns
]

{ #category : #accessing }
BrColumnsChanged >> columns: anObject [
	columns := anObject
]
