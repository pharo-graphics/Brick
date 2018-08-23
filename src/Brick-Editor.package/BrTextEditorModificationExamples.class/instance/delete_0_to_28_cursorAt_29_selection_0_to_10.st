examples - deletion
delete_0_to_28_cursorAt_29_selection_0_to_10
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 29.
	anEditor select: 0 to: 10.

	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor position equals: 1.
	self assert: anEditor selection isEmpty.

	^ anEditor