Class {
	#name : #BrTextEditorOnObjectPrintStringExamples,
	#superclass : #BrTextEditorExamples,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'example - Object>>#printString' }
BrTextEditorOnObjectPrintStringExamples >> editorOnObjectPrintString [
	<gtExample>

	^ self newEditor text: self textObjectPrintString
]

{ #category : #'example - Object>>#printString' }
BrTextEditorOnObjectPrintStringExamples >> elementOnObjectPrintString [
	<gtExample>
	
	^ self newElement editor: self editorOnObjectPrintString
]

{ #category : #'example - Object>>#printString' }
BrTextEditorOnObjectPrintStringExamples >> textObjectPrintString [
	<gtExample>
	
	^ (Object>>#printString) sourceCode asRopedText monospace
]
