initialization
initialize
	super initialize.
	
	editor := BrTextEditor new.
	replacedSegments := Stack new.
	replacedSegmentsCleaned := false