examples - scripting
compositeAllClassesAndPackage
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column
		title: 'Class';
		evaluated: [ :aClass | aClass name ].
		
	aList column
		title: 'Package';
		evaluated: [ :aClass | aClass package name ].

	^ aList