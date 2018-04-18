examples - colored element stencil
coloredElementUsingBlock
	<gtExample>
	| aStencil anElement |
	
	aStencil := [ :aColor :aCornerRadius |
		BlElement new
			size: 200@200;
			background: aColor;
			geometry: (BlRectangle cornerRadius: aCornerRadius) ] asStencil.
	aStencil arguments: { (Color blue alpha: 0.5) . 50 }.

	anElement := aStencil create.

	self assert: anElement background equals: ((Color blue alpha: 0.5) asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 50).
	
	^ anElement