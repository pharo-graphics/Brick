Class {
	#name : #BrTextWordPieceSelectionAcquiredHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceSelectionAcquiredHandler >> eventClass [
	^ BlElementSelectionAcquiredEvent
]

{ #category : #'api - event managing' }
BrTextWordPieceSelectionAcquiredHandler >> handleEvent: anEvent [
	| anEditorElement aTextElement aGlobalFrom aGlobalTo |

	"To not create an instance of me for each tiny text element"
	anEditorElement := anEvent currentTarget
		allParentsDetect: [ :anElement | anElement isKindOf: BrEditorElement ]
		ifFound: #yourself
		ifNone: [ ^ self ].

	anEvent consumed: true.

	aTextElement := anEvent currentTarget.
	
	"selection bounds equal to our bounds => fast select the whole text piece"
	(anEvent bounds = aTextElement boundsInLocal)
		ifTrue: [
			aGlobalFrom := (aTextElement text start - 1) max: 0.
			aGlobalTo := (aTextElement text start + aTextElement text size - 1) max: 0 ]
		ifFalse: [ 
			| aFromIndex aToIndex |
			aFromIndex := aTextElement paragraph indexAtPosition: anEvent bounds origin.
			aToIndex := aTextElement paragraph indexAtPosition: anEvent bounds corner.

			"remove previous selection"	
			aTextElement selection do: [ :aMonotoneSelection |
				aGlobalFrom := aTextElement text start + aMonotoneSelection from - 1.
				aGlobalTo := aTextElement text start + aMonotoneSelection to - 1.
				
				anEditorElement editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ].
			
			aGlobalFrom := (aTextElement text start + aFromIndex - 1) max: 0.
			aGlobalTo := (aTextElement text start + aToIndex - 1) max: 0 ].
		
	anEditorElement editor recordSelection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo)
]
