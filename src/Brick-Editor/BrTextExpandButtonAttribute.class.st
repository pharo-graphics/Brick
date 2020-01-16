"
I am a text attribute that adds a small expand button that when clicked may apply further attribues on the text
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
	^ BlElement new
		size: 8 @ 11;
		margin: (BlInsets top: 1 right: 5 bottom: 0 left: 5);
		background: (Color gray alpha: 0.4);
		geometry: self buttonGeometry;
		addEventHandlerOn: BlClickEvent
			do: [ :anEvent | self handleEventAffect: aTBrTextEditorTextualPiece in: anEditorElement editor ]
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
BrTextExpandButtonAttribute >> buttonGeometry [
	^ BlPolygon
		vertices:
			(self isExpanded
				ifTrue: [ {(0 @ 3).
					(8 @ 3).
					(4 @ 11)} ]
				ifFalse: [ {(0 @ 3).
					(8 @ 7).
					(0 @ 11)} ])
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
BrTextExpandButtonAttribute >> handleEventAffect: aTBrTextEditorTextualPiece in: aTextEditor [
	| aBrText |
	
	aBrText := aTBrTextEditorTextualPiece text.

	isExpanded
		ifTrue: [ aBrText clearAttributes: [ :aTextAttribute | 
				self createdAttributes includes: aTextAttribute ] ]
		ifFalse: [ self createAttributesAffect: aBrText in: aTextEditor ].
	self isExpanded: isExpanded not.

	aTextEditor updater
		from: aTBrTextEditorTextualPiece textStart
		to: aTBrTextEditorTextualPiece textEnd;
		update.
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
