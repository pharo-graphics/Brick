example - instance creation
buttonContentElementWithLinearLayout
	<gtExample>

	^ BlElement new
		border: (BlBorder paint: Color black width: 1);
		background: (Color white alpha: 0.5);
		layout: BlLinearLayout new alignCenter;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent.
			c padding: (BlInsets all: 10) ]