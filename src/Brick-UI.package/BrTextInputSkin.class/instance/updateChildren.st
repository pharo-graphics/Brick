updating
updateChildren
	widget
		removeChildren;
		addChildren: {innerContainer}.
	innerContainer
		removeChildren;
		addChildren: {textContainer. placeholderText}.
	textContainer
		removeChildren;
		addChildren: {text. caret}.
	