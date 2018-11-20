"
I am a special type of selection recorder that always starts with empty selection and in the end replaces editor's selection with recorder one.
Basically, I am a single (monotone) selection strategy.
"
Class {
	#name : #BrTextEditorSelectionOverwriteRecorder,
	#superclass : #BrTextEditorSelectionRecorder,
	#instVars : [
		'compositeSelection'
	],
	#category : 'Brick-Editor-Model - Selection'
}

{ #category : #selection }
BrTextEditorSelectionOverwriteRecorder >> commit: aTextEditor [
	"Commit recorded selection intervals in a given text editor"
	
	aTextEditor selection: (BlCompositeSelection new add: self selection).
	aTextEditor updateSelection: 1 to: aTextEditor text size.

	compositeSelection := BlCompositeSelection new
]

{ #category : #selection }
BrTextEditorSelectionOverwriteRecorder >> deselect: aMonotoneTextSelection in: aTextEditor [

	(BrTextEditorRecordDeselectionSignal new selection: aMonotoneTextSelection) emit.

	compositeSelection remove: aMonotoneTextSelection.
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to
]

{ #category : #initialization }
BrTextEditorSelectionOverwriteRecorder >> initialize [
	super initialize.
	
	compositeSelection := BlCompositeSelection new
]

{ #category : #selection }
BrTextEditorSelectionOverwriteRecorder >> prepare: aTextEditor [
	
	compositeSelection := BlCompositeSelection new.

	aTextEditor selectNone
]

{ #category : #selection }
BrTextEditorSelectionOverwriteRecorder >> select: aMonotoneTextSelection in: aTextEditor [
	"Add a given selection to the list of recorded selections"
	
	(BrTextEditorRecordSelectionSignal new selection: aMonotoneTextSelection) emit.

	compositeSelection add: aMonotoneTextSelection.
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to
]

{ #category : #selection }
BrTextEditorSelectionOverwriteRecorder >> selection [
	<return: #BlSelection>

	^ compositeSelection isEmpty
		ifTrue: [ BlSelection empty ]
		ifFalse: [ BlMonotoneSelection from: compositeSelection from to: compositeSelection to ]
]
