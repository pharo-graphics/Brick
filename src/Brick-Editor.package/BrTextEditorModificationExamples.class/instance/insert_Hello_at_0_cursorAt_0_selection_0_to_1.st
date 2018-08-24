examples - insertion
insert_Hello_at_0_cursorAt_0_selection_0_to_1
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
	self assert: anEditor cursor position equals: 5.
	self assert: anEditor selection isEmpty.

	^ anEditor