Class {
	#name : #BrTextEditorLayoutMeasurementExamples,
	#superclass : #Object,
	#traits : 'TBrTextEditorFixedMeasurerExamples',
	#classTraits : 'TBrTextEditorFixedMeasurerExamples classTrait',
	#category : #'Brick-Examples-Editor'
}

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
