private - updating
updateAll
	"Update rendering of the whole text within the editor"
	| aCommand |
	
	aCommand := self newUpdateCommand
		fromIndex: self segmentCollector start;
		toIndex: self segmentCollector end.
	self enqueueCommand: aCommand