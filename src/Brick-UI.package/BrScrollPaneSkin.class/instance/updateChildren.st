as yet unclassified
updateChildren
	super updateChildren.
	widget
		removeChildren;
		addChildren:{ hbar. vbar. viewport}