Class {
	#name : #BrTextEditorIndex,
	#superclass : #Object,
	#instVars : [
		'index'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'instance creation' }
BrTextEditorIndex class >> index: aNumber [
	^ self new index: aNumber
]

{ #category : #converting }
BrTextEditorIndex >> asCursorIndex: aText [
	^ self subclassResponsibility
]

{ #category : #accessing }
BrTextEditorIndex >> index [
	<return: #Number>

	^ index
]

{ #category : #accessing }
BrTextEditorIndex >> index: aNumber [
	index := aNumber
]
