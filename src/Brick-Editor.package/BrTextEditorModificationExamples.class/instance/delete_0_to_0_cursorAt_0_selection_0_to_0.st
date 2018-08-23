examples - deletion
delete_0_to_0_cursorAt_0_selection_0_to_0
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 0.
	
	anEditor deleter
		from: 0 to: 0;
		delete.

	self assert: anEditor text asString equals: (self multilineText asString).
	self assert: anEditor cursor position equals: 0.
	self assert: anEditor selection isEmpty.

	^ anEditor