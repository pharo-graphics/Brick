examples - model
buttonModel
	<gtExample>

	^ BrButtonModel new
		action: [ :aButtonElement :aButtonModel |
			aButtonModel model: #clicked.
			self inform: 'clicked' ]