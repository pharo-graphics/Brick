Class {
	#name : #BrTextEditorModificationExamples,
	#superclass : #Object,
	#category : 'Brick-Editor-Examples'
}

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_add_at_0_and_0_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 0;
		addAt: 0;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.

	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.

	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_add_at_0_and_1_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 0;
		addAt: 1;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1 }.
		
	self assert: theAddedEvents size equals: 2.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_add_at_0_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 0;
		apply;
		unsubscribe.
		
	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_add_at_1_and_0_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |

	anEditor := self editorOnMultilineText.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 1;
		addAt: 0;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1 }.

	self assert: theAddedEvents size equals: 2.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.

	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_add_at_1_in_cursors_at_0 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 1;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1.
	}.
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 1
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.

	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_moveTo_0_in_cursors_at_0_and_1 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_and_1_in_empty.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		"even though it is a move event, what actually happens is we need to delete one cursor at (1) because the other one is already at the target position"
		moveTo: 0;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 1.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 1
	}.
	
	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_moveTo_0_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveTo: 0;
		apply;
		unsubscribe.
		
	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_moveTo_1_in_cursors_at_0 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveTo: 1;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 1 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 1).
	self assert: theMovedEvents first oldIndex equals: 0.
	self assert: theMovedEvents first newIndex equals: 1.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_moveTo_2_in_cursors_at_0_and_1 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |

	anEditor := self cursor_add_at_0_and_1_in_empty.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveTo: 2;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 2 }.

	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 2).
	self assert: theMovedEvents first oldIndex equals: 0.
	self assert: theMovedEvents first newIndex equals: 2.
	self assert: theRemovedEvents size equals: 1.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 1
	}.

	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_removeAll_in_cursors_at_0_and_1 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_and_1_in_empty.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		removeAll;
		apply;
		unsubscribe.

	self assert: anEditor cursor isEmpty.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 2.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1
	}.
	
	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_remove_at_0_in_cursors_at_0 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		removeAt: 0;
		apply;
		unsubscribe.

	self assert: anEditor cursor isEmpty.

	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 1.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
	}.

	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_remove_at_1_and_0_in_cursors_at_0_and_1 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_and_1_in_empty.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		removeAt: 0;
		removeAt: 1;
		apply;
		unsubscribe.

	self assert: anEditor cursor isEmpty.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 2.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1
	}.

	^ anEditor
]

{ #category : #'examples - cursor' }
BrTextEditorModificationExamples >> cursor_remove_at_1_in_cursors_at_0_and_1 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_and_1_in_empty.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		removeAt: 1;
		apply;
		unsubscribe.

	self assert: anEditor cursor isNotEmpty.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 1.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 1.
	}.
	
	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_0_cursorAt_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 0.

	anEditor deleter
		from: 0 to: 0;
		delete.

	self assert: anEditor text asString equals: (self multilineText asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_0_cursorAt_0_selection_0_to_10 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 10.
	
	anEditor deleter
		from: 0 to: 0;
		delete.

	self assert: anEditor text asString equals: (self multilineText asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 10).

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_1_cursorAt_0_selection_0_to_10 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 10.
	
	anEditor deleter
		from: 0 to: 1;
		delete.

	self assert: anEditor text asString equals: (self multilineText from: 2 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 9).

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_0_selection_0_to_10 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 10.
	
	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_0_selection_0_to_28 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 28.
	
	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_0_selection_0_to_29 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 29.
	
	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 1).

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_0_selection_0_to_38 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 38.

	anEditor deleter
		from: 0 to: 28;
		delete.

	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 10).

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_0_selection_0_to_38_and_48_to_50 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 38.
	anEditor select: 48 to: 50.

	anEditor deleter
		from: 0 to: 28;
		delete.

	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 10; select: 20 to: 22).

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_10_selection_0_to_10 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 10.
	anEditor select: 0 to: 10.
	
	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_28_selection_0_to_10 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 28.
	anEditor select: 0 to: 10.
	
	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_29_selection_0_to_10 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 29.
	anEditor select: 0 to: 10.

	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 1 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - deletion' }
BrTextEditorModificationExamples >> delete_0_to_28_cursorAt_38_selection_0_to_10 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 38.
	anEditor select: 0 to: 10.

	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 10 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'instance creation' }
BrTextEditorModificationExamples >> editor [
	<gtExample>
	
	^ BrTextEditor new
]

{ #category : #'instance creation' }
BrTextEditorModificationExamples >> editorOnMultilineText [
	<gtExample>
	| anEditor |
	
	anEditor := self editor text: self multilineText.

	self assert: anEditor cursor isEmpty.	
	self assert: anEditor selection isEmpty.
	
	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_atCursorAt_0_and_1_selection_no [
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
	self assert: anEditor cursor allCursors equals: {
		BrTextEditorSingleCursor new position: 5.
		BrTextEditorSingleCursor new position: 11 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_0_cursorAt_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 0.
	
	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_0_cursorAt_0_selection_0_to_1 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 1.

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 2 to: self multilineText size) asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 10.
	
	anEditor select: 0 to: 1. "A"
	anEditor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 2 to: 7) asString, (self multilineText from: 14 to: self multilineText size) asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 12 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 10.
	anEditor select: 0 to: 1. "A"
	anEditor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 15 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 5 to: 6.
		BlSelection from: 13 to: 19.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete_no_selection [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 10.
	anEditor select: 0 to: 1. "A"
	anEditor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		withoutSelectionUpdate;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 15 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 0 to: 1.
		BlSelection from: 8 to: 14.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete_no_selection_no_cursor [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 10.
	anEditor select: 0 to: 1. "A"
	anEditor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		withoutSelectionUpdate;
		withoutCursorUpdate;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 10 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 0 to: 1.
		BlSelection from: 8 to: 14.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_0_cursorAt_5_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 5.
	anEditor select: 0 to: 0.

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 10 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_1_cursorAt_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 0.
	
	anEditor inserter
		at: 1;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: (self multilineText first asString, 'Hello', ((self multilineText from: 2 to: self multilineText size) asString)).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorModificationExamples >> insert_Hello_at_1_cursorAt_1_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 1.
	anEditor select: 0 to: 0.
	
	anEditor inserter
		at: 1;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: (self multilineText first asString, 'Hello', ((self multilineText from: 2 to: self multilineText size) asString)).
	self assert: anEditor cursor allCursors equals: { BrTextEditorSingleCursor new position: 6 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'instance creation' }
BrTextEditorModificationExamples >> multilineText [
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

{ #category : #'examples - selection' }
BrTextEditorModificationExamples >> selectedFirstLine [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	"low level selection method does not change cursor position"
	anEditor select: 0 to: 28.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 28).
	self assert: anEditor selectedText asString equals: 'A summer river being crossed'.

	self assert: anEditor cursor isEmpty.

	^ anEditor
]
