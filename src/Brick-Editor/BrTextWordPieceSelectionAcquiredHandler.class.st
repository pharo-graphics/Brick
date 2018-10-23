Class {
	#name : #BrTextWordPieceSelectionAcquiredHandler,
	#superclass : #BrTextWordPieceStatefulHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceSelectionAcquiredHandler >> eventClass [
	^ BlElementSelectionAcquiredEvent
]

{ #category : #'api - event managing' }
BrTextWordPieceSelectionAcquiredHandler >> handleEvent: anEvent [
	| aTextEditElement aGlobalFrom aGlobalTo |
	anEvent consumed: true.

	aTextEditElement := anEvent currentTarget.
	
	"selection bounds equal to our bounds => fast select the whole text piece"
	(anEvent bounds = aTextEditElement boundsInLocal)
		ifTrue: [
			aGlobalFrom := (aTextEditElement text start - 1) max: 0.
			aGlobalTo := (aTextEditElement text start + aTextEditElement text size - 1) max: 0 ]
		ifFalse: [ 
			| aFromIndex aToIndex |
			aFromIndex := aTextEditElement paragraph indexAtPosition: anEvent bounds origin.
			aToIndex := aTextEditElement paragraph indexAtPosition: anEvent bounds corner.

			"remove previous selection"	
			aTextEditElement selection do: [ :aMonotoneSelection |
				aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
				aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
				
				self editorElement editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ].
			
			aGlobalFrom := (aTextEditElement text start + aFromIndex - 1) max: 0.
			aGlobalTo := (aTextEditElement text start + aToIndex - 1) max: 0 ].
		
	self editorElement editor recordSelection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo)
]
