Class {
	#name : #BrTextEditorScreenToCursorTransformation,
	#superclass : #Object,
	#instVars : [
		'resultBlock'
	],
	#category : #'Brick-Editor-Model - Cursor'
}

{ #category : #dispatching }
BrTextEditorScreenToCursorTransformation >> evaluateOn: anObject [
	self subclassResponsibility
]

{ #category : #dispatching }
BrTextEditorScreenToCursorTransformation >> evaluateOn: anObject for: anEvent [
	self subclassResponsibility
]

{ #category : #accessing }
BrTextEditorScreenToCursorTransformation >> transformed: aTextIndex [
	resultBlock value: aTextIndex
]

{ #category : #accessing }
BrTextEditorScreenToCursorTransformation >> whenTransformed: aBlock [
	resultBlock := aBlock
]
