"
I am a text attribute that adds a small expand button that when clicked may apply further attributes on the text
"
Class {
	#name : #BrGlamorousTrangleExpanderTextAttribute,
	#superclass : #BrTextExpandButtonAttribute,
	#category : #'Brick-Glamorous'
}

{ #category : #accessing }
BrGlamorousTrangleExpanderTextAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	| aToggle |

	aToggle := BrTriangle new
		aptitude: BrGlamorousTriangleInCircleAptitude;
		expanded: self isExpanded;
		padding: (BlInsets all: 2);
		margin: (BlInsets top: 2);
		mouseCursor: BlCursor default;
		toggleAction: [
			self
				toggleExpandedOrCollapsedAttributesOn: aTBrTextEditorTextualPiece
				in: anEditorElement editor ].
		
	self
		applyExpandedOrCollapsedAttributesOn: aTBrTextEditorTextualPiece
		in: anEditorElement editor.

	^ aToggle
]
