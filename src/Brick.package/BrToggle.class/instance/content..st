api - widget
content: anElement
	"Set the given element as my content"

	self removeChildNamed: #content.
	self addChild: anElement as: #content