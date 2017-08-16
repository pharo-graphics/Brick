initialization
initialize
	super initialize.
	
	maxWidth := Float infinity.
	width := 0.
	height := 0.
	availableWidth := maxWidth.
	elements := OrderedCollection new.
	pushedQueue := LinkedList new