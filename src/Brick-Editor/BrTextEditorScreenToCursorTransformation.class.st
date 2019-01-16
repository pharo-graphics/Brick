Class {
	#name : #BrTextEditorScreenToCursorTransformation,
	#superclass : #Object,
	#instVars : [
		'resultBlock'
	],
	#category : #'Brick-Editor-Model - Cursor'
}

{ #category : #'as yet unclassified' }
BrTextEditorScreenToCursorTransformation >> evaluateOn: anObject [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrTextEditorScreenToCursorTransformation >> evaluateOn: anObject for: anEvent [
	self subclassResponsibility
]

{ #category : #visiting }
BrTextEditorScreenToCursorTransformation >> transformed: aTextIndex [
	resultBlock value: aTextIndex
]

{ #category : #'as yet unclassified' }
BrTextEditorScreenToCursorTransformation >> whenTransformed: aBlock [
	resultBlock := aBlock
]
