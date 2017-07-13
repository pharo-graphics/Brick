accessing
segmentAt: anIndex
	"Return segment at given index"
	<return: #BrEditorSegment>
	
	^ (self isCachedAt: anIndex)
		ifTrue: [ self cachedAt: anIndex ]
		ifFalse: [ self computeSegmentAt: anIndex ]