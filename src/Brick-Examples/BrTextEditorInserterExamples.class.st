Class {
	#name : #BrTextEditorInserterExamples,
	#superclass : #BrTextEditorOperatorExamples,
	#category : #'Brick-Examples-Editor'
}

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> filter_insert_Hello123Symbols_onlyAlphaNumeric [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.	
	anEditor editor moveCursorTo: 0.

	anEditor inserter
		at: 0;
		string: 'Hello123$#^)';
		onlyAlphaNumeric;
		insert.

	self assert: anEditor text asString equals: ('Hello123', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 8 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> filter_insert_Hello123_onlyDigits [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.	
	anEditor editor moveCursorTo: 0.

	anEditor inserter
		at: 0;
		string: 'Hello123';
		onlyDigits;
		insert.

	self assert: anEditor text asString equals: ('123', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 3 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> filter_insert_Hello123_onlyLetters [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.	
	anEditor editor moveCursorTo: 0.

	anEditor inserter
		at: 0;
		string: 'Hello123';
		onlyLetters;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_atCursorAt_0_and_1_selection_no [
	<gtExample>
	<description: '"Insertion at multiple cursors'>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor navigator
		addAt: 0;
		addAt: 1;
		apply.

	anEditor inserter
		atCursor;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 1 to: 1) asString, 'Hello', (self multilineText from: 2 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: {
		BrTextEditorSingleCursor new position: 5.
		BrTextEditorSingleCursor new position: 11 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.
	
	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_0_selection_0_to_1 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 1.

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 2 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 2 to: 7) asString, (self multilineText from: 14 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 12 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 15 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 5 to: 6.
		BlSelection from: 13 to: 19.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete_no_selection [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		withoutSelectionUpdate;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 15 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 0 to: 1.
		BlSelection from: 8 to: 14.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete_no_selection_no_cursor [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		withoutSelectionUpdate;
		withoutCursorUpdate;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 10 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 0 to: 1.
		BlSelection from: 8 to: 14.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_5_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 5.
	anEditor editor select: 0 to: 0.

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 10 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_1_cursorAt_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.
	
	anEditor inserter
		at: 1;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: (self multilineText first asString, 'Hello', ((self multilineText from: 2 to: self multilineText size) asString)).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_1_cursorAt_1_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 1.
	anEditor editor select: 0 to: 0.
	
	anEditor inserter
		at: 1;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: (self multilineText first asString, 'Hello', ((self multilineText from: 2 to: self multilineText size) asString)).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 6 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_0_to_1 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 0 to: 1;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (String tab, self multilineText asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 1 to: 2.
	}.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_0_to_41 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 0 to: 41;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (String tab, (self multilineText from: 1 to: 29) asString, String tab, (self multilineText from: 30 to: self multilineText size) asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 1 to: 43.
	}.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_1_to_2 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 1 to: 2;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (String tab, self multilineText asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 2 to: 3.
	}.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_29_to_67 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 29 to: 67;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (
		(self multilineText from: 1 to: 29) asString,
		String tab, (self multilineText from: 30 to: 42) asString,
		String tab, (self multilineText from: 43 to: self multilineText size) asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 30 to: 69.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_0_and_1_and_3_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.
	
	anEditor navigator
		addAt: 1;
		addAt: 3;
		apply.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		insert.

	self assert: anEditor text asString equals: (
		'()', self multilineText first asString, '()',
		self multilineText second asString, self multilineText third asString,
		'()', ((self multilineText from: 4 to: self multilineText size) asString)).

	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 1 . BrTextEditorSingleCursor new position: 4. . BrTextEditorSingleCursor new position: 8 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_0_and_1_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.
	
	anEditor navigator
		addAt: 1;
		apply.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		insert.

	self assert: anEditor text asString equals: ('()',self multilineText first asString, '()', ((self multilineText from: 2 to: self multilineText size) asString)).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 1 . BrTextEditorSingleCursor new position: 4 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_0_and_3_selection_0_to_1_withoutSelectionDelete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 1.
	
	anEditor navigator
		addAt: 3;
		apply.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (
		'(',self multilineText first asString,')',
		self multilineText second asString, self multilineText third asString,
		'()', (self multilineText from: 4 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: {
		BrTextEditorSingleCursor new position: 1.
		BrTextEditorSingleCursor new position: 6 }.

	self assert: anEditor selection allSelections equals: {
		BlSelection from: 1 to: 2.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		insert.

	self assert: anEditor text asString equals: ('()', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 1 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_0_selection_0_to_1 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 1.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		insert.

	self assert: anEditor text asString equals: ('()', (self multilineText from: 2 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 1 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_0_selection_0_to_1_withoutSelectionDelete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 1.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: ('(',self multilineText first asString,')', (self multilineText from: 2 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 1 }.

	self assert: anEditor selection allSelections equals: {
		BlSelection from: 1 to: 2.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_0_selection_2_to_8_withoutSelectionDelete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 2 to: 8.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: ('()', self multilineText  asString).
	self assert: anEditor cursors allCursors equals: {
		BrTextEditorSingleCursor new position: 1 }.

	self assert: anEditor selection allSelections equals: {
		BlSelection from: 4 to: 10.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_10_selection_2_to_8_withoutSelectionDelete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	anEditor editor select: 2 to: 8.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (
		(self multilineText from: 1 to: 10) asString,
		'()',
		(self multilineText from: 11 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: {
		BrTextEditorSingleCursor new position: 11 }.

	self assert: anEditor selection allSelections equals: {
		BlSelection from: 2 to: 8.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_2_selection_2_to_8_withoutSelectionDelete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 2.
	anEditor editor select: 2 to: 8.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (
		(self multilineText from: 1 to: 2) asString,
		'(', (self multilineText from: 3 to: 8) asString, ')',
		(self multilineText from: 9 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: {
		BrTextEditorSingleCursor new position: 3 }.

	self assert: anEditor selection allSelections equals: {
		BlSelection from: 3 to: 9.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_openParentheses_at_cursor_8_selection_2_to_8_withoutSelectionDelete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 8.
	anEditor editor select: 2 to: 8.
	
	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (
		(self multilineText from: 1 to: 2) asString,
		'(', (self multilineText from: 3 to: 8) asString, ')',
		(self multilineText from: 9 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: {
		BrTextEditorSingleCursor new position: 9 }.

	self assert: anEditor selection allSelections equals: {
		BlSelection from: 3 to: 9.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_open_close_parentheses_at_cursor_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.

	anEditor inserter
		atCursor;
		string: '(';
		surroundings: { '(' -> ')' };
		insert.

	anEditor inserter
		atCursor;
		string: ')';
		surroundings: { '(' -> ')' };
		insert.

	self assert: anEditor text asString equals: ('()', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 2 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]
