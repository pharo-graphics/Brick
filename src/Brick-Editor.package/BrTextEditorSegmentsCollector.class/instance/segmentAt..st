accessing
segmentAt: anIndex
	"Return segment at given index"
	<return: #BrTextEditorSegment>
	
	^ (self isCachedAt: anIndex)
		ifTrue: [ self cachedAt: anIndex ]
		ifFalse: [ self computeSegmentAt: anIndex ]