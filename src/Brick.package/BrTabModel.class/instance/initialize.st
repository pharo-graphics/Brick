initialization
initialize
	super initialize.

	selected := false.
	contentStencilBuilder := [ BlElement new size: 50@50; background: Color random ] asStencilBuilder.
	actionStencilBuilder := [ BlElement new size: 0@0 ] asStencilBuilder