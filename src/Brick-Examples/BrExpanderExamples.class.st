Class {
	#name : #BrExpanderExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Expander'
}

{ #category : #'as yet unclassified' }
BrExpanderExamples >> expanderForText [
	<gtExample>
	| anExpander |
	
	anExpander := BrExpander new.
	anExpander layout: BlLinearLayout vertical.
	anExpander vFitContent; hMatchParent.
	anExpander look: BrExpanderLook new.
	anExpander header: [ (BlTextElement text: 'I am the first line of the text' asRopedText) when: BlClickEvent do: [ anExpander expand ] ].
	anExpander content: [ BrEditorElement new editor: (BrTextEditor new text: ('I am the first line of the text', String cr, 'I am the second line') asRopedText) ].

	^ anExpander
]
