"
I am used to record text selection intervals while user drags mouse over the text editor.
Additionally I play a role of a selection strategy to support single or multiple selection.
"
Class {
	#name : #BrTextEditorSelectionRecorder,
	#superclass : #Object,
	#category : 'Brick-Editor-Model - Selection'
}

{ #category : #selection }
BrTextEditorSelectionRecorder >> commit: aTextEditor [
	"Commit recorded selection intervals in a given text editor"
	
	self subclassResponsibility
]

{ #category : #selection }
BrTextEditorSelectionRecorder >> deselect: aMonotoneTextSelection in: aTextEditor [
	"Remove a given selection from recorded selections"
	
	self subclassResponsibility
]

{ #category : #selection }
BrTextEditorSelectionRecorder >> prepare: aTextEditor [
	"Prepare recorder for accepting selection intervals"
	
	^ self subclassResponsibility
]

{ #category : #selection }
BrTextEditorSelectionRecorder >> select: aMonotoneTextSelection in: aTextEditor [
	"Add a given selection to the list of recorded selections"
	
	self subclassResponsibility
]

{ #category : #selection }
BrTextEditorSelectionRecorder >> selection [
	"Return current recorded selection"
	<return: #BlSelection>

	^ self subclassResponsibility
]
