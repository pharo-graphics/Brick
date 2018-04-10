examples - scripting
compositeAllClassesSingleColumn
	<gtExample>
	| aList |
	
	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column title: 'Class'.

	^ aList