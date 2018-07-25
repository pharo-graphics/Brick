api - widget
action: aBlockOrSymbolOrValuable
	"An action can be a block with two optional parameters:
	 - a UI element to which this button model is attached
	 - this button model
	[ :aButtonElement :aButtonModel |  ].

	Button action must not be nil"

	self
		assert: [ aBlockOrSymbolOrValuable isNotNil ]
		description: [ 'Button action must not be nil' ].

	action := aBlockOrSymbolOrValuable