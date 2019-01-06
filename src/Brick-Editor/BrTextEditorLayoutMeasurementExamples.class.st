Class {
	#name : #BrTextEditorLayoutMeasurementExamples,
	#superclass : #Object,
	#traits : 'TBrTextEditorFixedMeasurerExamples',
	#classTraits : 'TBrTextEditorFixedMeasurerExamples classTrait',
	#category : #'Brick-Editor-Examples'
}

{ #category : #testing }
BrTextEditorLayoutMeasurementExamples class >> isAbstract [
	^ true
]

{ #category : #'instance creation' }
BrTextEditorLayoutMeasurementExamples >> editorElement [
	<gtExample>
	| anEditorElement |
	
	anEditorElement := BrEditorElement new.
	anEditorElement editor: self textEditor.
	
	^ anEditorElement
]

{ #category : #'instance creation' }
BrTextEditorLayoutMeasurementExamples >> editorElementFitContentBoth [
	<gtExample>
	
	^ self editorElement
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrTextEditorLayoutMeasurementExamples >> editorElementMatchParentBoth [
	<gtExample>
	
	^ self editorElement
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #'instance creation' }
BrTextEditorLayoutMeasurementExamples >> editorElementMatchParentHorizontalFitContentVertical [
	<gtExample>
	
	^ self editorElement
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrTextEditorLayoutMeasurementExamples >> text [
	^ '' asRopedText
]

{ #category : #'instance creation' }
BrTextEditorLayoutMeasurementExamples >> textEditor [
	<gtExample>	
	| aTextEditor |

	aTextEditor := BrTextEditor new.
	aTextEditor text: (self text lineSpacing: self lineSpacing; paragraphMargin: self paragraphMargin; wordPadding: self wordPadding).
	aTextEditor segmentBuilder
		wordStencil: [ :aText :anEditorElement :aSegmentPiece |
			| aTextElement |
			aTextElement := BrTextWordPieceStencilBuilder new
				text: aText;
				editorElement: anEditorElement;
				asElement.
			aTextElement measurer: self fixedMeasurer.
			aTextElement ].
		
	^ aTextEditor
]
