text - styling
styleText
	"I request styler to re-style my current text"
	
	self text isEmpty
		ifTrue: [ ^ self ].
	
	self text size > 200
		ifTrue: [ self styler styleInBackgroundProcess: self text nextGeneration ]
		ifFalse: [ self styler style: self text nextGeneration ]