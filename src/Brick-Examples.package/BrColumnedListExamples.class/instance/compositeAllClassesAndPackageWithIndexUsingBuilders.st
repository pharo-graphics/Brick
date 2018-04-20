examples - scripting
compositeAllClassesAndPackageWithIndexUsingBuilders
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList display: Smalltalk allClasses.
	aList column
		title: 'Index';
		stencil: [ :aClass :anIndex |
			BlTextElement new
				width: 30;
				margin: (BlInsets all: 3);
				text: (anIndex asString asRopedText foreground: Color gray) ].

	aList column
		title: 'Class';
		stencil: BrColumnedListNameCellStencilBuilder new.

	aList column
		title: 'Package';
		stencil: [ :aClass | BrListLabelStencil new text: aClass package name asString ].

	^ aList