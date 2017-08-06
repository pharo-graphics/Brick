text - selection
deselect: aFromTextIndex to: aToTextIndex
	"Deselect text within an interval defined by provided from and to indices without any other side effects.
	Note:
		- I don't change cursor position.
		- I request segments update"
	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.

	aCommand := self newDeselectCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand