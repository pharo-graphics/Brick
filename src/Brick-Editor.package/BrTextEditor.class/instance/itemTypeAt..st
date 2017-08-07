accessing
itemTypeAt: aPosition
	"Return segment type at a given position"
	<return: #BrEditorSegmentType>
	
	^ (segmentsCollector segmentAt: aPosition) type