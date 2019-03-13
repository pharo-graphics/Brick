Class {
	#name : #BrTextEditorSelecterExamples,
	#superclass : #BrTextEditorOperatorExamples,
	#category : #'Brick-Examples-Editor'
}

{ #category : #'examples - all' }
BrTextEditorSelecterExamples >> select_all_in_empty [
	<gtExample>
	| anEditor |

	anEditor := self editorOnEmptyText.
	anEditor selecter all select.

	anEditor selecter all select.

	self assert: anEditor cursors isEmpty.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - all' }
BrTextEditorSelecterExamples >> select_all_in_empty_with_curor [
	<gtExample>
	| anEditor |

	anEditor := self editorOnEmptyText.

	anEditor navigator
		addAt: 0;
		apply.
	
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	anEditor selecter all select.

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

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
