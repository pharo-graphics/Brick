examples - scripting
compositeAllClassesAndPackageWithIndex
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column
		title: 'Index';
		evaluated: [ :aClass :aRowIndex | aRowIndex ];
		shape: [ :aRowIndex :anElement | anElement width: 30 ].

	aList column
		title: 'Class';
		evaluated: [ :aClass | aClass name ].
		
	aList column
		title: 'Package';
		evaluated: [ :aClass | aClass package name ].

	^ aList