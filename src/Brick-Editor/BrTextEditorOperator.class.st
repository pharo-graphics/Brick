Class {
	#name : #BrTextEditorOperator,
	#superclass : #Object,
	#instVars : [
		'editor'
	],
	#category : 'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorOperator >> cursor [
	^ self editor cursor
]

{ #category : #accessing }
BrTextEditorOperator >> editor [
	^ editor
]

{ #category : #accessing }
BrTextEditorOperator >> editor: aBrTextEditor [
	editor := aBrTextEditor
]

{ #category : #accessing }
BrTextEditorOperator >> selection [
	^ self editor selection
]

{ #category : #accessing }
BrTextEditorOperator >> text [
	^ self editor text
]
