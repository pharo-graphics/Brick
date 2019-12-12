"
!Text attributes 
!!How to create a link in a text?

${example:BrTextAttributesHowToGuide>>#linkInText|previewExpanded}$
"
Class {
	#name : #BrTextAttributesHowToGuide,
	#superclass : #Object,
	#category : #'Brick-Editor-Documentation'
}

{ #category : #'as yet unclassified' }
BrTextAttributesHowToGuide >> linkInText [
	<gtExample>
	| text |
	text := 'You can click on this.' asRopedText.
	(text from: 9 to: 13) attributes: {
		BlTextForegroundAttribute new paint: Color blue.
		BrTextHoverStylableAttribute new 
			attribute: (BlTextUnderlineAttribute new paint: Color blue).
		BrTextClickAttribute new 
			action: [ :aTBrTextEditorTextualPiece :aTarget :aTextEditor :anEvent | GtInspector openOn: aTBrTextEditorTextualPiece text ] }.
	^ text 
]
