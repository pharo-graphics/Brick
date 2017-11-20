drawing
drawMeAndChildrenOnSpartaCanvas: aCanvas

	(session ~~ Smalltalk session or: [ cachedSurface isNil ]) ifTrue: [
		| aCachedCanvas |
		session := Smalltalk session.
		aCachedCanvas := aCanvas similar: self boundsInWindow extent ceiling asIntegerPoint.
		super drawMeAndChildrenOnSpartaCanvas: aCachedCanvas.
		cachedSurface := aCachedCanvas surface.
		aCachedCanvas release ].

	aCanvas fill
		paint: cachedSurface;
		path: cachedSurface bounds;
		draw