"
I am a text attribute that adds a small expand button that when clicked may apply further attributes on the text
"
Class {
	#name : #BrTextExpandButtonAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#instVars : [
		'isExpanded',
		'attributesCreatingBlock',
		'createdAttributes'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #private }
BrTextExpandButtonAttribute >> applyExpandedOrCollapsedAttributesOn: aTBrTextEditorTextualPiece in: aTextEditor [
	"Add attributes if expanded and remove if collapsed"
	| aBrText |
	
	aBrText := aTBrTextEditorTextualPiece text.
	"we should not forget to remove already created attributes"
	aBrText clearAttributes: [ :aTextAttribute | self createdAttributes includes: aTextAttribute ].
	
	isExpanded
		ifTrue: [ self createAttributesAffect: aBrText in: aTextEditor ]
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> attributesCreatingBlock [
	^ attributesCreatingBlock
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> attributesCreatingBlock: aBlock [
	attributesCreatingBlock := aBlock
]

{ #category : #private }
BrTextExpandButtonAttribute >> collapsedGeometry [
	^ BlPolygon
		vertices: {
			(0 @ 0).
			(8 @ 4).
			(0 @ 8)
		}
]

{ #category : #private }
BrTextExpandButtonAttribute >> createAttributesAffect: aBrText in: aTextEditor [
	createdAttributes := (attributesCreatingBlock
		cull: aBrText
		cull: aTextEditor) asOrderedCollection.
	aBrText attributes: createdAttributes
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> createdAttributes [
	^ createdAttributes
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> createdAttributes: aCollection [
	createdAttributes := aCollection
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	| aToggle |

	aToggle := BrTriangle new
		look: BrGlamorousTriangleInCircleLook;
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

{ #category : #private }
BrTextExpandButtonAttribute >> expandedGeometry [
	^ BlPolygon
		vertices: {
			(0 @ 0).
			(8 @ 0).
			(4 @ 8)
		}
]

{ #category : #initialization }
BrTextExpandButtonAttribute >> initialize [
	super initialize.
	
	self beAppend.
	
	attributesCreatingBlock := [ OrderedCollection new ].
	isExpanded := false.
	createdAttributes := OrderedCollection new
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> isExpanded [
	^ isExpanded
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> isExpanded: aBoolean [
	isExpanded := aBoolean
]

{ #category : #private }
BrTextExpandButtonAttribute >> toggleExpandedOrCollapsedAttributesOn: aTBrTextEditorTextualPiece in: aTextEditor [
	self isExpanded: isExpanded not.
	self applyExpandedOrCollapsedAttributesOn: aTBrTextEditorTextualPiece in: aTextEditor
]
