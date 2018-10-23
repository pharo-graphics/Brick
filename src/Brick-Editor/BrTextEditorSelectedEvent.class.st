"
I am sent by the text editor model when an interval of text is selected
"
Class {
	#name : #BrTextEditorSelectedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-Model - Events'
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
