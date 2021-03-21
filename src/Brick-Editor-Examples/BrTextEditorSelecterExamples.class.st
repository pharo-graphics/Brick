Class {
	#name : #BrTextEditorSelecterExamples,
	#superclass : #BrTextEditorOperatorExamples,
	#category : #'Brick-Editor-Examples-Operators'
}

{ #category : #'examples - all' }
BrTextEditorSelecterExamples >> select_all_in_empty [
	<gtExample>
	| anEditor |

	anEditor := self editorOnEmptyText.

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

{ #category : #'examples - all' }
BrTextEditorSelecterExamples >> select_all_reduced [
	"There was a bug, that if a new text is smaller than the existing selection, then things can go wrong"
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		all
		select.
		
	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: self multilineText size).
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: { self multilineText size }).

	anEditor text: 'hello'.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 5).
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: { 5 }).
	
	anEditor selecter
		all
		select.

	anEditor text: 'hi'.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 2).
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: { 2 }).

	^ anEditor
]

{ #category : #accessing }
BrTextEditorSelecterExamples >> select_moveOneLeft_at_4 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 4.
	anEditor selecter moveOneToLeft; select.
	self 
		assert: anEditor selection 
		equals: (BlCompositeSelection new select: 3 to: 4).
	self 
		assert: anEditor editor selectedText asString 
		equals: 'u'.
	"self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(4))."
	^ anEditor
]

{ #category : #accessing }
BrTextEditorSelecterExamples >> select_moveOneLeft_at_4_extendToNextWordEnd [
	<gtExample>
	| anEditor |
	anEditor := self select_moveOneLeft_at_4.
	anEditor selecter extendToNextWordEnd; select.
"	self 
		assert: anEditor selection 
		equals: (BlCompositeSelection new select: 4 to: 8).
	self 
		assert: anEditor editor selectedText asString 
		equals: 'mmer'."
	^ anEditor
]

{ #category : #accessing }
BrTextEditorSelecterExamples >> select_moveOneRight_at_6 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 6.
	anEditor selecter moveOneToRight; select.
	self 
		assert: anEditor selection 
		equals: (BlCompositeSelection new select: 6 to: 7).
	self 
		assert: anEditor editor selectedText asString 
		equals: 'e'.
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(7)).
	^ anEditor
]

{ #category : #accessing }
BrTextEditorSelecterExamples >> select_moveOneRight_at_6_extendToNextWordEnd_twice [
	<gtExample>
	| anEditor |
	anEditor := self select_moveOneRight_at_6.
	anEditor selecter extendToNextWordEnd; select.
	self 
		assert: anEditor selection 
		equals: (BlCompositeSelection new select: 6 to: 8).
	self 
		assert: anEditor editor selectedText asString 
		equals: 'er'.
	anEditor selecter extendToNextWordEnd; select.
	self 
		assert: anEditor selection 
		equals: (BlCompositeSelection new select: 6 to: 14).
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
