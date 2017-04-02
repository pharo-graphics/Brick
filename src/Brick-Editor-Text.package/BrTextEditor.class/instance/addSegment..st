adding
addSegment: aSegmentSubText
	lastSegment := (BrTextEditorSegment new segment: aSegmentSubText).
	segments at: aSegmentSubText put: lastSegment