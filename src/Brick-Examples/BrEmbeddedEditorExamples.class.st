Class {
	#name : #BrEmbeddedEditorExamples,
	#superclass : #BrTextEditorExamples,
	#traits : 'TBrTextEditorFixedMeasurerExamples',
	#classTraits : 'TBrTextEditorFixedMeasurerExamples classTrait',
	#category : #'Brick-Examples-Editor'
}

{ #category : #'examples - embedded' }
BrEmbeddedEditorExamples >> editorWithEmbeddedEditor [
	<gtExample>

	^ self newEditor
		text: self textWithEmbeddedEditor;
		segmentBuilderDo: [ :aSegmentBuilder | self makeFixedMeasurement: aSegmentBuilder ]
]

{ #category : #'examples - embedded' }
BrEmbeddedEditorExamples >> elementWithEmbeddedEditor [
	<gtExample>
	
	^ self newElement editor: self editorWithEmbeddedEditor
]

{ #category : #'private - instance creation' }
BrEmbeddedEditorExamples >> embeddedEditorText [
	^ 'Hello world' asRopedText
]

{ #category : #'examples - embedded' }
BrEmbeddedEditorExamples >> embeddedTextEditorElement [
	"<gtExample>"
	| anEditorElement |

	anEditorElement := BrTextEditorOnObjectPrintStringExamples new elementOnObjectPrintString
		padding: (BlInsets all: 10);
		border: (BlBorder paint: Color gray);
		background: (Color gray alpha: 0.2);
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ].

	anEditorElement editor text: self embeddedEditorText.
	self makeFixedMeasurement: anEditorElement editor segmentBuilder.
	
	anEditorElement forceLayout.
	
	self assert: anEditorElement width equals: (self embeddedEditorText size * self glyphWidth).
	self assert: anEditorElement height equals: (self glyphHeight).

	^ anEditorElement
]

{ #category : #'private - instance creation' }
BrEmbeddedEditorExamples >> mainEditorText [
	^ self newThreeLineText fontSize: 20
]

{ #category : #private }
BrEmbeddedEditorExamples >> makeFixedMeasurement: aSegmentBuilder [

	aSegmentBuilder
		wordStencil: [ :aText :anEditorElement :aSegmentPiece |
			| aTextElement |
			aTextElement := BrTextWordPieceStencilBuilder new
				text: aText;
				editorElement: anEditorElement;
				asElement.
			aTextElement measurer: self fixedMeasurer.
			aTextElement ]
]

{ #category : #'examples - embedded' }
BrEmbeddedEditorExamples >> textWithEmbeddedEditor [
	<gtExample>
	| aText |

	aText := self mainEditorText.
	(aText from: 5 to: 5) attribute:
		(BrTextAdornmentDynamicAttribute new
			beAppend;
			stencil: [
				| anEditorElement |
				anEditorElement := BrTextEditorOnObjectPrintStringExamples new elementOnObjectPrintString
					padding: (BlInsets all: 10);
					border: (BlBorder paint: Color gray);
					background: (Color gray alpha: 0.2).

				anEditorElement editor text: self embeddedEditorText.
				self makeFixedMeasurement: anEditorElement editor segmentBuilder.
				anEditorElement ]).

	^ aText
]
