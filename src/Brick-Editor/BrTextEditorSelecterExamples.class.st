Class {
	#name : #BrTextEditorSelecterExamples,
	#superclass : #BrTextEditorOperatorExamples,
	#category : #'Brick-Editor-Examples - Operators'
}

{ #category : #'examples - word' }
BrTextEditorSelecterExamples >> select_word_at_0 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		wordAt: 0;
		select.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 1).
	self assert: anEditor editor selectedText asString equals: 'A'.

	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(1)).

	^ anEditor
]

{ #category : #'examples - word' }
BrTextEditorSelecterExamples >> select_word_at_1 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		wordAt: 1;
		select.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 1).
	self assert: anEditor editor selectedText asString equals: 'A'.

	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(1)).

	^ anEditor
]

{ #category : #'examples - word' }
BrTextEditorSelecterExamples >> select_word_at_2 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		wordAt: 2;
		select.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 2 to: 8).
	self assert: anEditor editor selectedText asString equals: 'summer'.

	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(8)).

	^ anEditor
]

{ #category : #'examples - word' }
BrTextEditorSelecterExamples >> select_word_at_2_and_10 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		wordAt: 2;
		wordAt: 10;
		select.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 2 to: 8; select: 9 to: 14).
	self assert: anEditor editor selectedText asString equals: 'summer river'.

	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(8 14)).

	^ anEditor
]
