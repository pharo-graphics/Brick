drawing
drawOnSpartaCanvas: aCanvas
	
	self flag: 'Fix sparta-cairo'.
	(session ~~ Smalltalk session or: [ cachedSurface isNil ]) ifTrue: [
		| aCachedCanvas |
		aCachedCanvas := aCanvas similar: self boundsInWindow extent ceiling asIntegerPoint.
		super drawOnSpartaCanvas: aCachedCanvas.
		cachedSurface := aCachedCanvas surface.
		aCachedCanvas release ].

	aCanvas fill
		paint: cachedSurface;
		path: cachedSurface bounds;
		draw