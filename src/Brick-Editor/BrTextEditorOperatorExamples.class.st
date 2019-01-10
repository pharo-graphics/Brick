Class {
	#name : #BrTextEditorOperatorExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples - Operators'
}

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editor [
	<gtExample>
	
	^ BrTextEditor new
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editorElement [
	<gtExample>
	
	^ BrEditorElement new
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editorElementOnMultilineText [
	<gtExample>
	| anEditor anEditorElement |
	
	anEditor := self editor text: self multilineText.
	anEditorElement := self editorElement.
	
	anEditorElement editor: anEditor.
	anEditorElement forceLayout.

	self assert: anEditor cursor isEmpty.	
	self assert: anEditor selection isEmpty.
	
	^ anEditorElement
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editorOnMultilineText [
	<gtExample>
	| anEditor anEditorElement |

	anEditorElement := self editorElementOnMultilineText.
	anEditor := anEditorElement editor.

	^ anEditor
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> multilineText [
	<gtExample>
	
	^ 'A summer river being crossed
how pleasing
with sandals in my hands!

Light of the moon
Moves west, flowers'' shadows
Creep eastward.

In the moonlight,
The color and scent of the wisteria
Seems far away.' asRopedText
]
