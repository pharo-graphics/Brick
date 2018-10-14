Class {
	#name : #BrEmbeddedEditorExamples,
	#superclass : #BrTextEditorExamples,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'examples - embedded' }
BrEmbeddedEditorExamples >> editorWithEmbeddedEditor [
	<gtExample>

	^ self newEditor
		text: self textWithEmbeddedEditor;
		segmentBuilderDo: [ :aSegmentBuilder |
			aSegmentBuilder
				wordStencil: [ :aText :anEditorElement |
					| aTextElement |
					aTextElement := BrTextWordPieceStencilBuilder new
						text: aText;
						editorElement: anEditorElement;
						asElement.
					aTextElement measurer: BlTextElementFixedMeasurer new.
					aTextElement ] ]
]

{ #category : #'examples - embedded' }
BrEmbeddedEditorExamples >> elementWithEmbeddedEditor [
	<gtExample>
	
	^ self newElement editor: self editorWithEmbeddedEditor
]

{ #category : #'examples - embedded' }
BrEmbeddedEditorExamples >> textWithEmbeddedEditor [
	<gtExample>
	| aText |

	aText := self newThreeLineText fontSize: 20.
	(aText from: 5 to: 5) attribute:
		(BrTextAdornmentDynamicAttribute new
			beAppend;
			stencil: [
				BrTextEditorOnObjectPrintStringExamples new elementOnObjectPrintString
					padding: (BlInsets all: 10);
					border: (BlBorder paint: Color gray);
					background: (Color gray alpha: 0.2) ]).

	^ aText
]
