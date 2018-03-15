initialization
initialize
	super initialize.

	label := 'Tab'.
	icon := (BlEllipse radius: 5) asElement.
	selected := false.
	enabled := true.
	content := [ BlElement new size: 50@50; background: Color random ]