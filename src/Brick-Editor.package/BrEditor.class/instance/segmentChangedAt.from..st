updating
segmentChangedAt: anIndex from: anEditorBuilder

	self iterator
		rebuildSegmentAt: anIndex
		of: anEditorBuilder.

	self notifyItemsChanged: (anIndex to: anIndex)