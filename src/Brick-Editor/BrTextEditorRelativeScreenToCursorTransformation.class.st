Class {
	#name : #BrTextEditorRelativeScreenToCursorTransformation,
	#superclass : #BrTextEditorScreenToCursorTransformation,
	#instVars : [
		'cursor',
		'direction'
	],
	#category : #'Brick-Editor-Model - Cursor'
}

{ #category : #accessing }
BrTextEditorRelativeScreenToCursorTransformation >> beDown [
	self direction: #down
]

{ #category : #accessing }
BrTextEditorRelativeScreenToCursorTransformation >> beUp [
	self direction: #up
]

{ #category : #accessing }
BrTextEditorRelativeScreenToCursorTransformation >> cursor [
	^ cursor
]

{ #category : #accessing }
BrTextEditorRelativeScreenToCursorTransformation >> cursor: anObject [
	cursor := anObject
]

{ #category : #accessing }
BrTextEditorRelativeScreenToCursorTransformation >> direction [
	^ direction
]

{ #category : #accessing }
BrTextEditorRelativeScreenToCursorTransformation >> direction: aSymbol [
	direction := aSymbol
]

{ #category : #dispatching }
BrTextEditorRelativeScreenToCursorTransformation >> evaluateOn: anObject [
	anObject relativeScreenToCursor: self
]

{ #category : #dispatching }
BrTextEditorRelativeScreenToCursorTransformation >> evaluateOn: anObject for: anEvent [
	anObject relativeScreenToCursor: self for: anEvent
]

{ #category : #testing }
BrTextEditorRelativeScreenToCursorTransformation >> isDown [
	^ self direction = #down
]

{ #category : #testing }
BrTextEditorRelativeScreenToCursorTransformation >> isUp [
	^ self direction = #up
]
