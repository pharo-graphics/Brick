examples - colored element stencil
defaultColoredElementUsingStencil
	<gtExample>
	| aStencil anElement |
	
	aStencil := self coloredElementStencil.
	anElement := aStencil create.

	self assert: anElement background equals: (Color gray asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 20).
	
	^ anElement