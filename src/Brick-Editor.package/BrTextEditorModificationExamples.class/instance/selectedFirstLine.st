examples - selection
selectedFirstLine
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	"low level selection method does not change cursor position"
	anEditor select: 0 to: 28.

	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 28).
	self assert: anEditor selectedText asString equals: 'A summer river being crossed'.

	self assert: anEditor cursor isVisible not.
	self assert: anEditor cursor position isZero.

	^ anEditor