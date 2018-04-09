examples - list
listAllClasses
	<gtExample>
	| aListElement aListLook aListModel |
	
	aListElement := self listElement.
	
	aListModel := self listModel.
	aListModel items: Smalltalk allClasses.
	
	aListLook := self listLook.
	aListLook shape: [ :anItem |
		BlElement new
			margin: (BlInsets all: 3);
			viewModel: (BrToggleModel new label: anItem asString);
			look: BrLabelLook + (BrLayoutLook linearHorizontal fitContent) ].
	
	aListElement look: aListLook.
	aListElement viewModel: aListModel.
	
	^ aListElement