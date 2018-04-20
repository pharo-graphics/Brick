examples - scripting
compositeAllClassesAndPackageWithIndex
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column
		title: 'Index';
		stencil: [ :aClass :anIndex |
			(BrListLabelStencil new text: (anIndex asString asRopedText foreground: Color gray)) asElement width: 30 ].

	aList column
		title: 'Class';
		stencil: [ :aClass | BrListLabelStencil new text: aClass name asString ].

	aList column
		title: 'Package';
		stencil: [ :aClass | BrListLabelStencil new text: aClass package name asString ].

	^ aList