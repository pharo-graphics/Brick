example - instance creation
buttonContentElementWithFrameLayout
	<gtExample>

	^ BlElement new
		border: (BlBorder paint: Color black width: 1);
		background: (Color white alpha: 0.5);
		layout: BlFrameLayout new;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent.
			c padding: (BlInsets all: 10) ]