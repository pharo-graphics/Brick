example - instance creation
buttonLabelLookWithConstraints
	<gtExample>

	^ BrLabelLook new labelDo: [ :aLabelElement | 
		aLabelElement constraintsDo: [ :c |
			c frame vertical alignCenter.
			c frame horizontal alignCenter ] ]