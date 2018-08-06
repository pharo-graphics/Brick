instance creation
editorOnMultilineText
	<gtExample>
	| anEditor |
	
	anEditor := self editor text: self multilineText.
	
	self assert: anEditor cursor isVisible not.
	self assert: anEditor cursor position isZero.
	
	self assert: anEditor selection isEmpty.
	
	^ anEditor