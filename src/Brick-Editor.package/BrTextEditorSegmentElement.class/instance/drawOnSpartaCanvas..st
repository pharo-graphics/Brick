drawing
drawOnSpartaCanvas: aCanvas
	super drawOnSpartaCanvas: aCanvas.
	
	self flag: 'Fix sparta-cairo'.
	"cachedSurface ifNil: [
		| aCachedCanvas |
		aCachedCanvas := aCanvas similar: self boundsInWindow extent ceiling asIntegerPoint.
		super drawOnSpartaCanvas: aCachedCanvas.
		cachedSurface := aCachedCanvas surface.
		aCachedCanvas release ].
	aCanvas fill
		paint: cachedSurface;
		path: cachedSurface bounds;
		draw"