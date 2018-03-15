api - layout
resizer: aBlLayoutResizer
	resizer := aBlLayoutResizer.

	self header layout isHorizontal
		ifTrue: [ self beHorizontal ]
		ifFalse: [ self beVertical ]