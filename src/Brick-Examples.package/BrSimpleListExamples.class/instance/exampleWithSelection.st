examples - selection
exampleWithSelection
	<gtExample>
	| aList |
	aList := BrSimpleList new.
	aList
		stencil: [ :each :index |			
			BlTextElement new
				text: each key asRopedText;
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 5);
				when: BlClickEvent do: [ :anEvent  |
					anEvent consumed: true.
					aList selectOne: index ] ];
		display: (Smalltalk ui icons icons associations);
		when: BrSelectionChanged do: [ :anEvent |
			anEvent selectedDo: [ :anInterval | self inform: 'Selected: ', anInterval asString ].
			anEvent deselectedDo: [ :anInterval | self inform: 'Deselected: ', anInterval asString ] ].
		
	^ aList