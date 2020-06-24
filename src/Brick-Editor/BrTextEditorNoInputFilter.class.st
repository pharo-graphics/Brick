"
I don't apply any filter and return the bare input
"
Class {
	#name : #BrTextEditorNoInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorNoInputFilter >> filter: aString [
	<return: #String>
	
	^ aString
]
