private - updating
invalidate: aFromTextIndex to: aToTextIndex
	"Invalidate segments (reset their internal cache) within text interval specified by from and to indices"
	| aCommand |
	self assertIndex: aFromTextIndex to: aToTextIndex.
	
	aCommand := self newInvalidateCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand