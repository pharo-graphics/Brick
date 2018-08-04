private - updating
updateSelection: aFromTextIndex to: aToTextIndex
	"Update text rendering within an interval defined by provided from and to indices."
	| aCommand |
	
	aCommand := self newSelectionUpdateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand