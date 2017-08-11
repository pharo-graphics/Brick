accessing
segmentType
	"Return a type of this segment responsible for creation
	of segment holder and also used as a key for caching purposes"
	<return: #BrEditorSegmentType>
	
	^ self subclassResponsibility