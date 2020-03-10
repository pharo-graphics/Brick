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

{ #category : #accessing }
BrTextExpandButtonAttribute >> affect: aTBrTextEditorTextualPiece in: anEditorElement [
	| anIcon |

	anIcon := BlElement new.
	anIcon size: 8 @ 8.
	anIcon viewModel: (BrInteractiveModel withAll: { BrExpandableModel new }).
	anIcon look: (BrInteractiveCommonLook new
		expanded: [ :e | e geometry: self expandedGeometry ];
		collapsed: [ :e | e geometry: self collapsedGeometry ]).

	^ BrToggle new
		look: BrGlamorousButtonLayoutLook new + 
			BrGlamorousButtonIconLook new + 
			BrGlamorousWithLabelTooltipLook new + (BrInteractiveCommonLook new
				default: [ anIcon background: (BrGlamorousColors defaultButtonBorderColor) ];
				hovered: [ anIcon background: (BrGlamorousColors hoveredButtonBorderColor) ]);
		icon: anIcon;
		fitContent;
		padding: (BlInsets all: 2);
		margin: (BlInsets top: 2);
		mouseCursor: BlCursor default;
		label: 'Expand';
		when: BrToggleActivatedEvent do: [ :anEvent |
			anEvent currentTarget label: 'Collapse'.
			anIcon dispatchEvent: BrExpansionWish expand ];
		when: BrToggleDeactivatedEvent do: [ :anEvent |
			anEvent currentTarget label: 'Expand'.
			anIcon dispatchEvent: BrExpansionWish collapse ];
		action: [ :aButtonElement | 
			self
				handleEventAffect: aTBrTextEditorTextualPiece
				in: anEditorElement editor ]
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

{ #category : #private }
BrTextExpandButtonAttribute >> expandedGeometry [
	^ BlPolygon
		vertices: {
			(0 @ 0).
			(8 @ 0).
			(4 @ 8)
		}
]

{ #category : #private }
BrTextExpandButtonAttribute >> handleEventAffect: aTBrTextEditorTextualPiece in: aTextEditor [
	| aBrText |
	
	aBrText := aTBrTextEditorTextualPiece text.

	isExpanded
		ifTrue: [ aBrText clearAttributes: [ :aTextAttribute | self createdAttributes includes: aTextAttribute ] ]
		ifFalse: [ self createAttributesAffect: aBrText in: aTextEditor ].
	self isExpanded: isExpanded not.

	aTextEditor updater
		from: aTBrTextEditorTextualPiece textStart
		to: aTBrTextEditorTextualPiece textEnd;
		update
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
