accessing
itemTypeAt: aPosition
	"Return segment type at a given position"
	<return: #BrEditorSegmentType>
	
	^ (collector segmentAt: aPosition) type