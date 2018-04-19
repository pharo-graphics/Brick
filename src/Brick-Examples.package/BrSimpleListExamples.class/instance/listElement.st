examples - instance creation
listElement
	<gtExample>

	^ BlElement new
		constraintsDo: [ :c |
			c horizontal exact: 500.
			c vertical matchParent ]