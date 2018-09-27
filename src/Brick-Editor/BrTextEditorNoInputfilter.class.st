"
I don't apply any filter and return the bare input
"
Class {
	#name : #BrTextEditorNoInputfilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorNoInputfilter >> filter: aString [
	<return: #String>
	
	^ aString
]
