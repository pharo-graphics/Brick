text - modifications
offsetSegmentIndicesBy: anOffset
	"Offset segments' #index by anOffset of all cached segments"
	
	self
		offsetSegmentIndicesBy: anOffset
		after: self firstIndex - 1