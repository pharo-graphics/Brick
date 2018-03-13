instance creation
circleIcon
	<gtExample>
	
	^ BlElement new
		size: 6@6;
		background: Color red;
		geometry: BlEllipse new;
		margin: (BlInsets all: 3)