collector - adding
segment: anObject for: aBuilder
	"Add and return a new segment for a given object and builder"
	<return: #BrEditorSegment>
	| aSegment |
	
	aSegment := self newSegment.
	aSegment entity: anObject.
	aSegment builder: aBuilder.
	
	self segments add: aSegment.
	
	^ aSegment