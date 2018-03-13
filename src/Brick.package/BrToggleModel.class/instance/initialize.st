initialization
initialize
	super initialize.

	label := 'Toggle'.
	icon := (BlEllipse radius: 5) asElement.
	activated := false.
	oneWay := false