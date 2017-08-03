text - selection
select: aFromTextIndex to: aToTextIndex
	"Select text within an interval defined by provided from and to indices."
	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.
	
	aCommand := self newSelectCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand