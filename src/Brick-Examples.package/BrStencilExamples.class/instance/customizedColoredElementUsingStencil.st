examples - colored element stencil
customizedColoredElementUsingStencil
	<gtExample>
	| aStencil anElement |
	
	aStencil := self coloredElementStencil.
	aStencil color: (Color blue alpha: 0.5).
	aStencil cornerRadius: 50.
	
	anElement := aStencil create.

	self assert: anElement background equals: ((Color blue alpha: 0.5) asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 50).
	
	^ anElement