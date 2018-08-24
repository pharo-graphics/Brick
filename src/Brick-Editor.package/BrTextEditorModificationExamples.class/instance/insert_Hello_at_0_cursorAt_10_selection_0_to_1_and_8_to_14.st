examples - insertion
insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14
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
	self assert: anEditor cursor position equals: 12.
	self assert: anEditor selection isEmpty.

	^ anEditor