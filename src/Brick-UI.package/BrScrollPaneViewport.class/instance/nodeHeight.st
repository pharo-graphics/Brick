accessing
nodeHeight
	self children ifEmpty:[^ 1].
	^ self children first height