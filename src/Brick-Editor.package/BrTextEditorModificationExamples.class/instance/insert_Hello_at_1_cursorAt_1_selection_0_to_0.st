examples - insertion
insert_Hello_at_1_cursorAt_1_selection_0_to_0
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
	self assert: anEditor cursor position equals: 6.
	self assert: anEditor selection isEmpty.

	^ anEditor