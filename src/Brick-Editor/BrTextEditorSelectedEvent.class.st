Class {
	#name : #BrTextEditorSelectedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : 'Brick-Editor-UI'
}

{ #category : #accessing }
BrTextEditorSelectedEvent >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorSelectedEvent >> fromIndex: anObject [
	fromIndex := anObject
]

{ #category : #accessing }
BrTextEditorSelectedEvent >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorSelectedEvent >> toIndex: anObject [
	toIndex := anObject
]
