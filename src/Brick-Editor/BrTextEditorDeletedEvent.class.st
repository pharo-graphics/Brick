"
Is sent by the text editor after a piece of text was deleted from ==fromIndex== to ==toIndex== represented by a text index
"
Class {
	#name : #BrTextEditorDeletedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #'instance creation' }
BrTextEditorDeletedEvent class >> from: aFromIndex to: aToIndex [
	<return: #BrTextEditorDeletedEvent>

	^ self new
		fromIndex: aFromIndex;
		toIndex: aToIndex
]

{ #category : #accessing }
BrTextEditorDeletedEvent >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorDeletedEvent >> fromIndex: anObject [
	fromIndex := anObject
]

{ #category : #accessing }
BrTextEditorDeletedEvent >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorDeletedEvent >> toIndex: anObject [
	toIndex := anObject
]
