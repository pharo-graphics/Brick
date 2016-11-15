accessing
nodeWidth
	self children ifEmpty:[^ 1].
	^ self children first width