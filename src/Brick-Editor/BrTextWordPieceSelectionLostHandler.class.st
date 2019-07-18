Class {
	#name : #BrTextWordPieceSelectionLostHandler,
	#superclass : #BrTextWordPieceUniqueHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceSelectionLostHandler >> eventClass [
	^ BlElementSelectionLostEvent
]

{ #category : #'api - event managing' }
BrTextWordPieceSelectionLostHandler >> handleEvent: anEvent [
	| aTextEditElement anEditorElement |
	
	"To not create an instance of me for each tiny text element"
	anEditorElement := anEvent currentTarget
		allParentsDetect: [ :anElement | anElement isKindOf: BrEditorElement ]
		ifFound: #yourself
		ifNone: [ ^ self ].

	anEvent consumed: true.

	aTextEditElement := anEvent currentTarget.

	aTextEditElement selection do: [ :aMonotoneSelection |
		| aGlobalFrom aGlobalTo |

		aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
		aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
		anEditorElement editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ]
]
