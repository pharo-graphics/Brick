Class {
	#name : #BrTextEditorScreenToCursorTransformation,
	#superclass : #Object,
	#instVars : [
		'resultBlock',
		'resultIndex'
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

{ #category : #testing }
BrTextEditorScreenToCursorTransformation >> hasResult [
	^ resultIndex isNotNil
]

{ #category : #accessing }
BrTextEditorScreenToCursorTransformation >> transformed: aTextIndex [
	resultIndex := aTextIndex.
	resultBlock value: aTextIndex
]

{ #category : #accessing }
BrTextEditorScreenToCursorTransformation >> whenTransformed: aBlock [
	resultBlock := aBlock
]
