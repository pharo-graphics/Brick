Class {
	#name : #BrTextEditorDeselecter,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'selection'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'api - configuration' }
BrTextEditorDeselecter >> all [
	"Deselect the whole text"

	self selection do: [ :aMonotoneSelection | self from: aMonotoneSelection from to: aMonotoneSelection to ]
]

{ #category : #'api - processing' }
BrTextEditorDeselecter >> deselect [
	selection do: [ :aMonotoneSelection | self privateDeselect: aMonotoneSelection from to: aMonotoneSelection to ]
]

{ #category : #'api - configuration' }
BrTextEditorDeselecter >> from: aFromIndex to: aToIndex [
	selection select: aFromIndex to: aToIndex
]

{ #category : #initialization }
BrTextEditorDeselecter >> initialize [
	super initialize.

	selection := BlCompositeSelection new
]

{ #category : #'api - processing' }
BrTextEditorDeselecter >> outsideOfCursor [
	"Remove all selections that don't contain any existing cursor"

	self selection do: [ :aMonotoneSelection |
		self cursors do: [ :aCursor |
			(aCursor position = aMonotoneSelection from or: [ aCursor position = aMonotoneSelection to ])
				ifFalse: [ self from: aMonotoneSelection from to: aMonotoneSelection to ] ] ]
]

{ #category : #private }
BrTextEditorDeselecter >> privateDeselect: aFromTextIndex to: aToTextIndex [
	"Deselect text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	| aCommand |

	aCommand := BrTextEditorDeselectCommand new
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self editor enqueueCommand: aCommand
]
