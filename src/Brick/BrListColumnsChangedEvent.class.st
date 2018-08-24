Class {
	#name : #BrListColumnsChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'columns'
	],
	#category : 'Brick-List - Events'
}

{ #category : #accessing }
BrListColumnsChangedEvent class >> columns: anObject [
	^ self new columns: anObject
]

{ #category : #accessing }
BrListColumnsChangedEvent >> columns [
	^ columns
]

{ #category : #accessing }
BrListColumnsChangedEvent >> columns: anObject [
	columns := anObject
]
