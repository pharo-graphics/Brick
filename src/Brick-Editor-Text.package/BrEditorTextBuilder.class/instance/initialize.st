initialization
initialize
	super initialize.
	
	editor := BrTextEditorOld new.
	replacedSegments := Stack new.
	replacedSegmentsCleaned := false