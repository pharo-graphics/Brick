text - styling
styleText
	"I request styler to re-style my current text"
	
	self text size > 1000
		ifTrue: [ self styler styleInBackgroundProcess: self text copy ]
		ifFalse: [ self styler style: self text copy ]