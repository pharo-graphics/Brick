Class {
	#name : #BrTextEditorInputFilterMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'inputFilter'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorInputFilterMemento >> initialize [
	super initialize.
	
	inputFilter := BrTextEditorNoInputFilter new
]

{ #category : #evaluating }
BrTextEditorInputFilterMemento >> label [
	^ 'Input filter'
]

{ #category : #accessing }
BrTextEditorInputFilterMemento >> order [
	^ 50
]

{ #category : #memento }
BrTextEditorInputFilterMemento >> restoreStateOf: aTextEditor [
	aTextEditor inputFilter: inputFilter
]

{ #category : #memento }
BrTextEditorInputFilterMemento >> saveStateOf: aTextEditor [
	inputFilter := aTextEditor inputFilter
]

{ #category : #evaluating }
BrTextEditorInputFilterMemento >> value [
	^ inputFilter
]
