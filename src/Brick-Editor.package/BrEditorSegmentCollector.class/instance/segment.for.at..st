collector - adding
segment: anObject for: aBuilder at: anIndex
	"Add and return a new segment for a given object and builder"
	<return: #BrEditorSegment>
	| aSegment |
	
	aSegment := self newSegment.
	aSegment entity: anObject.
	aSegment builder: aBuilder.
	aSegment index: anIndex.
	
	self segments add: aSegment beforeIndex: anIndex.
	
	^ aSegment