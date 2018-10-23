"
I am sent to the segment piece element when the a text interval is deselected
"
Class {
	#name : #BrTextEditorDeselectRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorDeselectRequest >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorDeselectRequest >> fromIndex: anObject [
	fromIndex := anObject
]

{ #category : #accessing }
BrTextEditorDeselectRequest >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorDeselectRequest >> toIndex: anObject [
	toIndex := anObject
]
