Class {
	#name : #BrTextEditorNavigatorExamples,
	#superclass : #BrTextEditorOperatorExamples,
	#category : #'Brick-Examples-Editor'
}

{ #category : #'examples - add' }
BrTextEditorNavigatorExamples >> cursor_add_at_0_and_0_in_empty [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.

	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.

	^ anEditor
]

{ #category : #'examples - add' }
BrTextEditorNavigatorExamples >> cursor_add_at_0_and_1_in_empty [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: {
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

{ #category : #'examples - add' }
BrTextEditorNavigatorExamples >> cursor_add_at_0_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents addedCursorElements removedCursorElements |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.
	addedCursorElements := OrderedCollection new.
	removedCursorElements := OrderedCollection new.
	
	self subscribe: BrTextEditorCursorElementAddedEvent do: [ :anEvent | addedCursorElements add: anEvent cursorElement ] for: anEditor.
	self subscribe: BrTextEditorCursorElementRemovedEvent do: [ :anEvent | removedCursorElements add: anEvent cursorElement ] for: anEditor.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 0;
		apply;
		unsubscribe.
		
	anEditor forceLayout.
		
	self unsubscribe: BrTextEditorCursorElementAddedEvent from: anEditor.
	self unsubscribe: BrTextEditorCursorElementRemovedEvent from: anEditor.

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	self assert: addedCursorElements size equals: 1.
	self assert: addedCursorElements first textPosition equals: 0.
	self assert: removedCursorElements isEmpty.
	
	^ anEditor
]

{ #category : #'examples - add' }
BrTextEditorNavigatorExamples >> cursor_add_at_1_and_0_in_empty [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: {
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

{ #category : #'examples - add' }
BrTextEditorNavigatorExamples >> cursor_add_at_1_in_cursors_at_0 [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: {
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

{ #category : #'examples - add' }
BrTextEditorNavigatorExamples >> cursor_add_at_1_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents addedCursorElements removedCursorElements |
	
	anEditor := self editorOnMultilineText.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.
	addedCursorElements := OrderedCollection new.
	removedCursorElements := OrderedCollection new.

	self subscribe: BrTextEditorCursorElementAddedEvent do: [ :anEvent | addedCursorElements add: anEvent cursorElement ] for: anEditor.
	self subscribe: BrTextEditorCursorElementRemovedEvent do: [ :anEvent | removedCursorElements add: anEvent cursorElement ] for: anEditor.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 1;
		apply;
		unsubscribe.

	anEditor forceLayout.

	self unsubscribe: BrTextEditorCursorElementAddedEvent from: anEditor.
	self unsubscribe: BrTextEditorCursorElementRemovedEvent from: anEditor.

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 1 }.
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 1.
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	self assert: addedCursorElements size equals: 1.
	self assert: addedCursorElements first textPosition equals: 0.
	self assert: removedCursorElements isEmpty.
	
	^ anEditor
]

{ #category : #'examples - add' }
BrTextEditorNavigatorExamples >> cursor_add_at_68_in_empty [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents addedCursorElements removedCursorElements |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.
	addedCursorElements := OrderedCollection new.
	removedCursorElements := OrderedCollection new.
	
	self subscribe: BrTextEditorCursorElementAddedEvent do: [ :anEvent | addedCursorElements add: anEvent cursorElement ] for: anEditor.
	self subscribe: BrTextEditorCursorElementRemovedEvent do: [ :anEvent | removedCursorElements add: anEvent cursorElement ] for: anEditor.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		addAt: 68;
		apply;
		unsubscribe.
		
	anEditor forceLayout.
		
	self unsubscribe: BrTextEditorCursorElementAddedEvent from: anEditor.
	self unsubscribe: BrTextEditorCursorElementRemovedEvent from: anEditor.

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 68 }.
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 68.
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	self assert: addedCursorElements size equals: 1.
	self assert: addedCursorElements first textPosition equals: 0.
	self assert: removedCursorElements isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line end' }
BrTextEditorNavigatorExamples >> cursor_moveToLineEnd_in_cursors_at_0 [
	<gtExample>
	<label: 'Cursor before the first character of the line should move to the end'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineEnd;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 28 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 28).
	self assert: theMovedEvents first oldIndex equals: 0.
	self assert: theMovedEvents first newIndex equals: 28.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line end' }
BrTextEditorNavigatorExamples >> cursor_moveToLineEnd_in_cursors_at_1 [
	<gtExample>
	<label: 'Cursor after the first character of the line should move to the end'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 1;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineEnd;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 28 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 28).
	self assert: theMovedEvents first oldIndex equals: 1.
	self assert: theMovedEvents first newIndex equals: 28.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line end' }
BrTextEditorNavigatorExamples >> cursor_moveToLineEnd_in_cursors_at_201 [
	<gtExample>
	<label: 'Cursor before the last character of the whole text should not move'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 201;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineEnd;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 202 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 202).
	self assert: theMovedEvents first oldIndex equals: 201.
	self assert: theMovedEvents first newIndex equals: 202.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line end' }
BrTextEditorNavigatorExamples >> cursor_moveToLineEnd_in_cursors_at_202 [
	<gtExample>
	<label: 'Cursor after the last character of the whole text should not move'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 202;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineEnd;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 202 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line end' }
BrTextEditorNavigatorExamples >> cursor_moveToLineEnd_in_cursors_at_27 [
	<gtExample>
	<label: 'Cursor before the last character of the line should move to the end'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 27;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineEnd;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 28 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 28).
	self assert: theMovedEvents first oldIndex equals: 27.
	self assert: theMovedEvents first newIndex equals: 28.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line end' }
BrTextEditorNavigatorExamples >> cursor_moveToLineEnd_in_cursors_at_28 [
	<gtExample>
	<label: 'Cursor after the last character of the line should not move'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 28;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineEnd;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 28 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line end' }
BrTextEditorNavigatorExamples >> cursor_moveToLineEnd_in_empty [
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
		moveToLineEnd;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isEmpty.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_0 [
	<gtExample>
	<label: 'Cursor before the first character should not be moved'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_1 [
	<gtExample>
	<label: 'Cursor after the first character moves before the start of the text'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_moveTo_1_in_cursors_at_0.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 0).
	self assert: theMovedEvents first oldIndex equals: 1.
	self assert: theMovedEvents first newIndex equals: 0.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_27 [
	<gtExample>
	<label: 'Cursor before the last character of the line should move to the start'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 27;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 0).
	self assert: theMovedEvents first oldIndex equals: 27.
	self assert: theMovedEvents first newIndex equals: 0.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_28 [
	<gtExample>
	<label: 'Cursor after the last character of the line should move to to the start'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 28;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 0).
	self assert: theMovedEvents first oldIndex equals: 28.
	self assert: theMovedEvents first newIndex equals: 0.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_29 [
	<gtExample>
	<label: 'Cursor before the first character of the line should not move'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 29;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 29 }.

	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_30 [
	<gtExample>
	<label: 'Cursor after the first character of the line should move to the start of that line'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 30;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 29 }.

	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 29).
	self assert: theMovedEvents first oldIndex equals: 30.
	self assert: theMovedEvents first newIndex equals: 29.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_40 [
	<gtExample>
	<label: 'Cursor before the last character of the line should move to the start of that line'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 40;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 29 }.

	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 29).
	self assert: theMovedEvents first oldIndex equals: 40.
	self assert: theMovedEvents first newIndex equals: 29.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_cursors_at_41 [
	<gtExample>
	<label: 'Cursor after the last character of the line should move to the start of that line'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self cursor_add_at_0_in_empty.
	anEditor navigator
		moveTo: 41;
		apply.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 29 }.

	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 29).
	self assert: theMovedEvents first oldIndex equals: 41.
	self assert: theMovedEvents first newIndex equals: 29.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to line start' }
BrTextEditorNavigatorExamples >> cursor_moveToLineStart_in_empty [
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
		moveToLineStart;
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isEmpty.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to screen' }
BrTextEditorNavigatorExamples >> cursor_moveToScreen_1_left_half_in_empty [
	<gtExample>
	<label: 'Click on the left half of the first character'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |

	anEditor := self editorOnMultilineText.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToScreenPosition: (self paragraphMargin left + (self glyphWidth / 2.0) - 1) @ (self paragraphMargin top + (self glyphHeight / 2.0));
		apply;
		unsubscribe.

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(0)).

	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: (BrTextEditorCursor atAll: #(0)) allCursors.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to screen' }
BrTextEditorNavigatorExamples >> cursor_moveToScreen_1_left_in_empty [
	<gtExample>
	<label: 'Click on a whitespace to the left from the first character'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToScreenPosition: (self paragraphMargin left / 2.0) @ (self paragraphMargin top + (self glyphHeight / 2.0));
		apply;
		unsubscribe.

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(0)).
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: (BrTextEditorCursor atAll: #(0)) allCursors.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to screen' }
BrTextEditorNavigatorExamples >> cursor_moveToScreen_1_middle_in_empty [
	<gtExample>
	<label: 'Click right in the middle of the first character'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToScreenPosition: (self paragraphMargin left + (self glyphWidth / 2.0)) @ (self paragraphMargin top + (self glyphHeight / 2.0));
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(0)).
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: (BrTextEditorCursor atAll: #(0)) allCursors.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to screen' }
BrTextEditorNavigatorExamples >> cursor_moveToScreen_1_right_half_in_empty [
	<gtExample>
	<label: 'Click on the right half of the first character'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |
	
	anEditor := self editorOnMultilineText.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToScreenPosition: (self paragraphMargin left + (self glyphWidth / 2.0) + 1) @ (self paragraphMargin top + (self glyphHeight / 2.0));
		apply;
		unsubscribe.
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(1)).
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: (BrTextEditorCursor atAll: #(1)) allCursors.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to screen' }
BrTextEditorNavigatorExamples >> cursor_moveToScreen_41_right_in_empty [
	<gtExample>
	<label: 'Click on the right half of the 41th character'>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents |

	anEditor := self editorOnMultilineText.

	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveToScreenPosition: (400@100);
		apply;
		unsubscribe.

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors equals: (BrTextEditorCursor atAll: #(41)).

	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: (BrTextEditorCursor atAll: #(41)) allCursors.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to' }
BrTextEditorNavigatorExamples >> cursor_moveTo_0_in_cursors_at_0_and_1 [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 1.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 1
	}.
	
	^ anEditor
]

{ #category : #'examples - move to' }
BrTextEditorNavigatorExamples >> cursor_moveTo_0_in_empty [
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
		
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents size equals: 1.
	self assert: (theAddedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
	}.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to' }
BrTextEditorNavigatorExamples >> cursor_moveTo_1_in_cursors_at_0 [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 1 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 1).
	self assert: theMovedEvents first oldIndex equals: 0.
	self assert: theMovedEvents first newIndex equals: 1.
	self assert: theRemovedEvents isEmpty.
	
	^ anEditor
]

{ #category : #'examples - move to' }
BrTextEditorNavigatorExamples >> cursor_moveTo_2_in_cursors_at_0_and_1 [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 2 }.

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

{ #category : #'examples - move to' }
BrTextEditorNavigatorExamples >> cursor_moveTo_67_in_cursors_at_68 [
	<gtExample>
	| anEditor theAddedEvents theMovedEvents theRemovedEvents addedCursorElements removedCursorElements |
	
	anEditor := self cursor_add_at_68_in_empty.
	
	theAddedEvents := OrderedCollection new.
	theMovedEvents := OrderedCollection new.
	theRemovedEvents := OrderedCollection new.
	addedCursorElements := OrderedCollection new.
	removedCursorElements := OrderedCollection new.
	
	self subscribe: BrTextEditorCursorElementAddedEvent do: [ :anEvent | addedCursorElements add: anEvent cursorElement ] for: anEditor.
	self subscribe: BrTextEditorCursorElementRemovedEvent do: [ :anEvent | removedCursorElements add: anEvent cursorElement ] for: anEditor.

	anEditor navigator
		whenAdded: [ :anEvent | theAddedEvents add: anEvent ];
		whenMoved: [ :anEvent | theMovedEvents add: anEvent ];
		whenRemoved: [ :anEvent | theRemovedEvents add: anEvent ];
		moveTo: 67;
		apply;
		unsubscribe.
	
	anEditor forceLayout.

	self unsubscribe: BrTextEditorCursorElementAddedEvent from: anEditor.
	self unsubscribe: BrTextEditorCursorElementRemovedEvent from: anEditor.
	
	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 67 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents size equals: 1.
	self assert: theMovedEvents first cursor equals: (BrTextEditorSingleCursor new position: 67).
	self assert: theMovedEvents first oldIndex equals: 68.
	self assert: theMovedEvents first newIndex equals: 67.
	self assert: theRemovedEvents isEmpty.
	
	self assert: addedCursorElements size equals: 1.
	self assert: addedCursorElements first textPosition equals: 6.
	self assert: removedCursorElements size equals: 1.
	self assert: removedCursorElements first textPosition equals: 0.
	
	^ anEditor
]

{ #category : #'examples - remove' }
BrTextEditorNavigatorExamples >> cursor_removeAll_in_cursors_at_0_and_1 [
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

	self assert: anEditor cursors isEmpty.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 2.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1
	}.
	
	^ anEditor
]

{ #category : #'examples - remove' }
BrTextEditorNavigatorExamples >> cursor_remove_at_0_in_cursors_at_0 [
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

	self assert: anEditor cursors isEmpty.

	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 1.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
	}.

	^ anEditor
]

{ #category : #'examples - remove' }
BrTextEditorNavigatorExamples >> cursor_remove_at_1_and_0_in_cursors_at_0_and_1 [
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

	self assert: anEditor cursors isEmpty.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 2.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 0.
		BrTextEditorSingleCursor new position: 1
	}.

	^ anEditor
]

{ #category : #'examples - remove' }
BrTextEditorNavigatorExamples >> cursor_remove_at_1_in_cursors_at_0_and_1 [
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

	self assert: anEditor cursors isNotEmpty.
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	
	self assert: theAddedEvents isEmpty.
	self assert: theMovedEvents isEmpty.
	self assert: theRemovedEvents size equals: 1.
	self assert: (theRemovedEvents collect: #cursor) asArray equals: {
		BrTextEditorSingleCursor new position: 1.
	}.
	
	^ anEditor
]

{ #category : #'examples - showroom' }
BrTextEditorNavigatorExamples >> where_is_the_mouse [
	<gtExample>
	| anEditor |
	
	anEditor := self editorFor: 'where is the mouse over
the text editor?'.
	anEditor matchParent.
	
	^ anEditor
]
