examples - insertion
insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete_no_selection
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
	self assert: anEditor cursor position equals: 15.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 0 to: 1.
		BlSelection from: 8 to: 14.
	}.

	^ anEditor