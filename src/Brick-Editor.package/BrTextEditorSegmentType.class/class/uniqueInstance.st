accessing
uniqueInstance
	"Return a unique instance of my type. Since there may be a lot of
	segments of the same type it is better to refer to the same type object
	for memory usage and performance reasons"
	<return: #BrEditorSegmentType>

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]