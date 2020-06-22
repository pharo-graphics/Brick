Class {
	#name : #BrTextEditorLayoutMeasurementExamples,
	#superclass : #Object,
	#traits : 'TBrTextEditorFixedMeasurerExamples',
	#classTraits : 'TBrTextEditorFixedMeasurerExamples classTrait',
	#category : #'Brick-Editor-Examples'
}

{ #category : #'instance creation' }
BrTextEditorLayoutMeasurementExamples >> editorFor: aText [
	<return: #BrEditor>
	| anEditor aRopedText |

	aRopedText := aText asRopedText lineSpacing: self lineSpacing; paragraphMargin: self paragraphMargin; wordPadding: self wordPadding.

	anEditor := BrEditor new.
	anEditor look: BrEditorLook new.
	anEditor padding: BlInsets empty.
	anEditor fitContent.
	anEditor text: aRopedText.
	
	BlDevCrossover on: anEditor.
	
	anEditor editor segmentBuilder
		wordStencil: [ :aTBrTextEditorTextualPiece |
			| aTextElement |
			aTextElement := BrTextEditableWordPieceStencilBuilder new
				segmentPiece: aTBrTextEditorTextualPiece;
				asElement.
			aTextElement measurer: self fixedMeasurer.
			aTextElement measurer measurer textOffset: aTBrTextEditorTextualPiece textStart.
			aTextElement ].
	
	anEditor requestFocus.
	anEditor forceLayout.

	^ anEditor
]

{ #category : #'examples - measurement' }
BrTextEditorLayoutMeasurementExamples >> fit_content_Hello [
	<gtExample>
	<noTest>
	| anEditorElement |

	anEditorElement := self editorFor: 'Hello'.

	self assert: anEditorElement width equals: (5 * self glyphWidth) + (self paragraphMargin width).
	self assert: anEditorElement height equals: self glyphHeight + (self wordPadding height) + (self lineSpacing * 0) + (self paragraphMargin height).

	^ anEditorElement
]

{ #category : #'examples - measurement' }
BrTextEditorLayoutMeasurementExamples >> fit_content_Hello_World [
	<gtExample>
	<noTest>
	| anEditorElement |

	anEditorElement := self editorFor: 'Hello World'.

	self assert: anEditorElement width equals: (11 * self glyphWidth) + (self paragraphMargin width).
	self assert: anEditorElement height equals: self glyphHeight + (self wordPadding height) + (self lineSpacing * 0) + (self paragraphMargin height).

	^ anEditorElement
]
