Class {
	#name : #BrTextEditorSelectionMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'selection'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorSelectionMemento >> initialize [
	super initialize.
	
	selection := BlCompositeSelection new
]

{ #category : #evaluating }
BrTextEditorSelectionMemento >> label [
	^ 'Selection'
]

{ #category : #accessing }
BrTextEditorSelectionMemento >> order [
	^ 70
]

{ #category : #memento }
BrTextEditorSelectionMemento >> restoreStateOf: aTextEditor [
	| aSelecter |

	aTextEditor deselecter all deselect.

	aSelecter := aTextEditor selecter withoutCursorUpdate.
	selection do: [ :eachMonotoneSelection |
		aSelecter from: eachMonotoneSelection from to: eachMonotoneSelection to ].
	aSelecter select.
]

{ #category : #memento }
BrTextEditorSelectionMemento >> saveStateOf: aTextEditor [
	selection := aTextEditor selection copy.
]

{ #category : #accessing }
BrTextEditorSelectionMemento >> selection [
	^ selection
]

{ #category : #evaluating }
BrTextEditorSelectionMemento >> value [
	^ selection
]
