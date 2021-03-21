Class {
	#name : #BrExpanderExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Expander'
}

{ #category : #'examples - with text' }
BrExpanderExamples >> expanderWithText [
	<gtExample>
	| anExpander aText |

	aText := 'I am the first line of the text', String cr, 'I am the second line'.

	anExpander := BrExpander new
		vFitContent;
		hExact: 300;
		collapse;
		margin: (BlInsets all: 10);
		look: BrGlamorousExpanderLook new;
		header: [ BrEditorElement new editor: (BrTextEditor new text: aText lines first asRopedText) ];
		content: [ BrEditorElement new editor: (BrTextEditor new text: aText asRopedText) ].

	^ anExpander
]
