"
! Text attributes 
!! How to create a link in a text?
${example:BrTextAttributesHowToGuide>>#linkInText|previewExpanded}$
!! How to create a hide-able markup in a text?
${example:BrTextAttributesHowToGuide>>#hideMarkupInText|previewExpanded}$
"
Class {
	#name : #BrTextAttributesHowToGuide,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples-Documentation'
}

{ #category : #examples }
BrTextAttributesHowToGuide >> hideMarkupInText [
	<gtExample>
	| text leftMarker rightMarker |

	text := 'Move cursor **here** to show markup' asRopedText fontName: 'Source Sans Pro'; fontSize: 20.

	(text from: 15 to: 18) bold.

	(text from: 13 to: 14)
		foreground: Color gray;
		attribute: (leftMarker := BrTextInvisibleMarkerAttribute new).

	(text from: 19 to: 20)
		foreground: Color gray;
		attribute: (rightMarker := BrTextInvisibleMarkerAttribute new).

	(text from: 11 to: 22)
		onCursorEnter: [ :aTextEditor :anEvent :aFromIndex :aToIndex |
			| aSubText |
			(aSubText := (aTextEditor text from: aFromIndex to: aToIndex))
				findAttributes: { leftMarker . rightMarker }
				indicesDo: [ :aMarkupStart :aMarkupEnd |
					(aSubText from: aMarkupStart to: aMarkupEnd) clearAttributesOfClass: BrTextHideAttribute ] ]
		leave: [ :aTextEditor :anEvent :aFromIndex :aToIndex |
			| aSubText |
			(aSubText := (aTextEditor text from: aFromIndex to: aToIndex))
				findAttributes: { leftMarker  . rightMarker }
				indicesDo: [ :aMarkupStart :aMarkupEnd |
					(aSubText from: aMarkupStart to: aMarkupEnd) attribute: BrTextHideAttribute new ] ].

	^ BrEditor new
		look: BrGlamorousEditorLook new;
		text: text
]

{ #category : #examples }
BrTextAttributesHowToGuide >> linkInText [
	<gtExample>
	| text |
	text := 'You can click on this.' asRopedText.
	(text from: 9 to: 13)
		foreground: Color blue;
		onClick: [ :aTBrTextEditorTextualPiece :aTarget :aTextEditor :anEvent | anEvent currentTarget phlow spawnObject: aTBrTextEditorTextualPiece text ];
		attribute: (BrTextHoverStylableAttribute new attribute: (BlTextDecorationAttribute new underline color: Color blue)).
	^ text
]
