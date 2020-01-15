Class {
	#name : #BrTextEditorCommandExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'instance creation' }
BrTextEditorCommandExamples >> deleteCommand [
	<gtExample>
	
	^ BrTextEditorDeleteCommand new
]

{ #category : #'instance creation' }
BrTextEditorCommandExamples >> insertCharacter [
	<gtExample>
	
	^ $!
]
