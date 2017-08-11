private - updating
updateAll
	"Update text rendering within an interval defined by provided from and to indices."
	| aCommand |
	
	aCommand := self newUpdateCommand
		fromIndex: self segmentCollector start;
		toIndex: self segmentCollector end.
	self enqueueCommand: aCommand