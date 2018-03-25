example - instance creation
buttonModel
	<gtExample>
	
	^ BrButtonModel new
		label: self labelText;
		action: [ self inform: 'Clicked!' ]