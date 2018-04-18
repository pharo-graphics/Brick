examples - colored element stencil
defaultElementUsingBlock
	<gtExample>
	| aStencil anElement |
	
	aStencil := [
		BlElement new
			size: 200@200;
			background: Color gray;
			geometry: (BlRectangle cornerRadius: 20) ] asStencil.

	anElement := aStencil create.

	self assert: anElement background equals: (Color gray asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 20).
	
	^ anElement