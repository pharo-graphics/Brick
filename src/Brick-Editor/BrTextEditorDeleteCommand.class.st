Class {
	#name : #BrTextEditorDeleteCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : 'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorDeleteCommand >> executeOn: aTextEditor [
	aTextEditor text
		delete: ((self fromIndex + 1) min: self toIndex)
		to: self toIndex
]

{ #category : #accessing }
BrTextEditorDeleteCommand >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorDeleteCommand >> fromIndex: aNumber [
	<return: #Number>

	fromIndex := aNumber
]

{ #category : #accessing }
BrTextEditorDeleteCommand >> toIndex [
	<return: #Number>

	^ toIndex
]

{ #category : #accessing }
BrTextEditorDeleteCommand >> toIndex: aNumber [
	toIndex := aNumber
]
