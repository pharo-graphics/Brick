accessing
segmentTypeAt: anIndex
	"I return a type of a segment at a given index.
	By default there is only one type of segments.
	You may want to create a subclass and override me in order to support multiple ones"
	<return: #BrEditorSegmentType>

	^ (self segmentAt: anIndex) type