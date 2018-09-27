"
I am responsible for input filtering and is used by text editor inserter
"
Class {
	#name : #BrTextEditorInputFilter,
	#superclass : #Object,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorInputFilter >> filter: aString [
	<return: #String>
	
	^ self subclassResponsibility
]
