initialization
initialize
	super initialize.
	contentStencilBuilder := [ BlElement new size: 50@50; background: Color random ] asStencilBuilder.