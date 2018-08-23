examples - deletion
delete_0_to_28_cursorAt_0_selection_0_to_28
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 28.
	
	anEditor deleter
		from: 0 to: 28;
		delete.
	
	self assert: anEditor text asString equals: (self multilineText from: 29 to: self multilineText size) asString.
	self assert: anEditor cursor position equals: 0.
	self assert: anEditor selection isEmpty.

	^ anEditor