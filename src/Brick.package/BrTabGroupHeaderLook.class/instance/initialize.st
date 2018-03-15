initialization
initialize
	super initialize.

	tabs := OrderedDictionary new.
	resizer := BlLayoutResizer fitContent.
	header := BlElement new.

	self beHorizontal