examples - scripting
compositeAllClassesAndPackage
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column
		title: 'Class';
		stencil: [ :aClass | BrListLabelStencil new text: aClass name asString ].
		
	aList column
		title: 'Package';
		stencil: [ :aClass | BrListLabelStencil new text: aClass package name asString ].

	^ aList