collector - adding
segment: anObject
	"Add and return a new segment for a given segment object"
	<return: #BrEditorSegment>
	| aSegment |
	
	aSegment := self newSegment.
	aSegment entity: anObject.
	
	self segments add: aSegment.
	
	^ aSegment