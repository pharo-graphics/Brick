private - updating
update: aFromTextIndex to: aToTextIndex
	"Update text rendering within an interval defined by provided from and to indices."
	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.
	
	aCommand := self newUpdateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand