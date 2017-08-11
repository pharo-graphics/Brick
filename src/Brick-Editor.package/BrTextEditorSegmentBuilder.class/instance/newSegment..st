instance creation
newSegment: aBrSubText
	"Instantiate and return a new segment for a given subtext"
	<return: #BrEditorSegment>
	
	^ self subclassResponsibility