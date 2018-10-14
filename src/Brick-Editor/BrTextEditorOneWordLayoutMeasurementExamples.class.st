Class {
	#name : #BrTextEditorOneWordLayoutMeasurementExamples,
	#superclass : #BrTextEditorLayoutMeasurementExamples,
	#category : #'Brick-Editor-Examples'
}

{ #category : #examples }
BrTextEditorOneWordLayoutMeasurementExamples >> measureFitContentBoth [
	<gtExample>
	| anEditorElement |

	anEditorElement := self editorElementFitContentBoth.
	anEditorElement forceLayout.

	self assert: anEditorElement width equals: (self text size * self glyphWidth) + (self paragraphMargin width).
	self assert: anEditorElement height equals: self glyphHeight + (self wordPadding height) + (self lineSpacing * 0) + (self paragraphMargin height).

	^ anEditorElement
]

{ #category : #'instance creation' }
BrTextEditorOneWordLayoutMeasurementExamples >> text [
	^ 'Hello' asRopedText
]
