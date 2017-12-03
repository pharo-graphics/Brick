instance creation
newElement
	<gtExample>
	
	^ BrEditorElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		yourself