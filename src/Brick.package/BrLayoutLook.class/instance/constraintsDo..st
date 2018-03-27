api - constraints
constraintsDo: aBlock
	
	self
		assert: [ aBlock isNotNil ]
		description: [ 'Constraints block' ].

	consraintsBlock := aBlock.
	self widgetDo: [ :anElement | self targetElement constraintsDo: consraintsBlock ]