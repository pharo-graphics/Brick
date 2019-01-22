Class {
	#name : #BrTextEditorExplicitScreenToCursorTransformation,
	#superclass : #BrTextEditorScreenToCursorTransformation,
	#instVars : [
		'screenPosition'
	],
	#category : #'Brick-Editor-Model - Cursor'
}

{ #category : #dispatching }
BrTextEditorExplicitScreenToCursorTransformation >> evaluateOn: anObject [
	anObject explicitScreenToCursor: self
]

{ #category : #dispatching }
BrTextEditorExplicitScreenToCursorTransformation >> evaluateOn: anObject for: anEvent [
	anObject explicitScreenToCursor: self for: anEvent
]

{ #category : #accessing }
BrTextEditorExplicitScreenToCursorTransformation >> screenPosition [
	^ screenPosition
]

{ #category : #accessing }
BrTextEditorExplicitScreenToCursorTransformation >> screenPosition: anObject [
	screenPosition := anObject
]
