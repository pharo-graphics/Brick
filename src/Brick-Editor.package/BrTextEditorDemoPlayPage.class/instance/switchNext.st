as yet unclassified
switchNext
	self hasNext
		ifFalse: [ ^ self ].
		
	currentIndex := currentIndex + 1.
	self content: (steps at: currentIndex)