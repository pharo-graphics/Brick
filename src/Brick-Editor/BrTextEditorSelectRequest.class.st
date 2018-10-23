"
I am sent to the segment piece element when the a text interval is selected
"
Class {
	#name : #BrTextEditorSelectRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorSelectRequest >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorSelectRequest >> fromIndex: anObject [
	fromIndex := anObject
]

{ #category : #accessing }
BrTextEditorSelectRequest >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorSelectRequest >> toIndex: anObject [
	toIndex := anObject
]
