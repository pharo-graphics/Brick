Class {
	#name : #BrTextWordPieceSelectionLostHandler,
	#superclass : #BrTextWordPieceStatefulHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceSelectionLostHandler >> eventClass [
	^ BlElementSelectionLostEvent
]

{ #category : #'api - event managing' }
BrTextWordPieceSelectionLostHandler >> handleEvent: anEvent [
	| aTextEditElement |
	anEvent consumed: true.

	aTextEditElement := anEvent currentTarget.

	aTextEditElement selection do: [ :aMonotoneSelection |
		| aGlobalFrom aGlobalTo |

		aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
		aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
		self editorElement editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ]
]
