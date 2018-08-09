initialization
initialize
	super initialize.

	label := 'Tab'.
	icon := (BlEllipse radius: 5) asElement.
	selected := false.
	enabled := true.
	contentStencilBuilder := [ BlElement new size: 50@50; background: Color random ] asStencilBuilder.
	actionStencilBuilder := [BlElement new ] asStencilBuilder