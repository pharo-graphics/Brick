Class {
	#name : #BrTextEditorParagraphAttributesExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'instance creation' }
BrTextEditorParagraphAttributesExamples >> editorElement [
	<gtExample>
	| textEditor editorElement |
	
	textEditor := BrTextEditor new.
	editorElement := BrEditorElement new.
	editorElement editor: textEditor.
	editorElement constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].

	^ editorElement
]

{ #category : #examples }
BrTextEditorParagraphAttributesExamples >> helloEditor [
	<gtExample>
	| anEditorElement |

	anEditorElement := self editorElement.
	anEditorElement editor text: self helloText.
	
	anEditorElement forceLayout.

	self assert: anEditorElement editor segmentCollector segments size equals: 1.
	self
		assert: anEditorElement editor segmentCollector segments first lineSpacing
		equals: 20.
	self
		assert: anEditorElement editor segmentCollector segments first wordPadding
		equals: (BlInsets top: 10 bottom: 10).
	self
		assert: anEditorElement editor segmentCollector segments first paragraphMargin
		equals: (BlInsets top: 15 left: 20 bottom: 15 right: 20).

	^ anEditorElement
]

{ #category : #examples }
BrTextEditorParagraphAttributesExamples >> helloText [
	<gtExample>
	| aText |

	aText := 'Hello' asRopedText
		fontSize: 20;
		lineSpacing: 20;
		wordPadding: (BlInsets top: 10 bottom: 10);
		paragraphMargin: (BlInsets top: 15 left: 20 bottom: 15 right: 20).

	self
		assert: aText rope attributes
		equals: {
			BlFontSizeAttribute size: 20.
			BrTextParagraphLineSpacingAttribute lineSpacing: 20.
			BrTextParagraphWordPaddingAttribute wordPadding: (BlInsets top: 10 bottom: 10).
			BrTextParagraphMarginAttribute paragraphMargin: (BlInsets top: 15 left: 20 bottom: 15 right: 20)
		}.

	^ aText
]
