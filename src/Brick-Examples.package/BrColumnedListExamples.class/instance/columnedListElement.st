examples - instance creation
columnedListElement
	<gtExample>
	
	^ BlElement new
		constraintsDo: [ :c |
			c horizontal exact: 400.
			c vertical matchParent ]