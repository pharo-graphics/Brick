*Brick
viewModelDo: aBlock ifAbsent: anAbsentBlock
	self userData
		at: #brickViewModel
		ifPresent: aBlock
		ifAbsent: anAbsentBlock