examples - insertion
insert_Hello_at_0_cursorAt_5_selection_0_to_0
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
	self assert: anEditor cursor position equals: 10.
	self assert: anEditor selection isEmpty.

	^ anEditor