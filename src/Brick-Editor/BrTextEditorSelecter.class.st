Class {
	#name : #BrTextEditorSelecter,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'selection',
		'shouldUpdateCursor',
		'shouldDeselectExisting'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'api - configuration' }
BrTextEditorSelecter >> all [
	"Select the whole text"
	
	self
		from: 0
		to: self text size
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> from: aFromIndex to: aToIndex [
	selection select: aFromIndex to: aToIndex
]

{ #category : #initialization }
BrTextEditorSelecter >> initialize [
	super initialize.

	selection := BlCompositeSelection new.
	shouldUpdateCursor := true.
	shouldDeselectExisting := false
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> overwrite [
	"Deselect any selections if they exist and overwrite with the new selection"
	
	shouldDeselectExisting := true
]

{ #category : #private }
BrTextEditorSelecter >> privateDeselectExisting [
	self editor deselecter all deselect
]

{ #category : #private }
BrTextEditorSelecter >> privateSelect: aFromTextIndex to: aToTextIndex [
	"Select text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	| aCommand |
	
	aCommand := BrTextEditorSelectCommand new
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self editor enqueueCommand: aCommand
]

{ #category : #'api - processing' }
BrTextEditorSelecter >> select [

	shouldDeselectExisting
		ifTrue: [ self privateDeselectExisting ].

	selection do: [ :aMonotoneSelection | self privateSelect: aMonotoneSelection from to: aMonotoneSelection to ].
	(shouldUpdateCursor and: [ selection isNotEmpty ])
		ifTrue: [ self updateCursor ]
]

{ #category : #private }
BrTextEditorSelecter >> updateCursor [
	self editor moveCursorTo: selection to
]

{ #category : #'api - configuration' }
BrTextEditorSelecter >> withoutCursorUpdate [
	shouldUpdateCursor := false
]
