drawing
drawMeAndChildrenOnSpartaCanvas: aCanvas

	(session ~~ Smalltalk session or: [ cachedSurface isNil ]) ifTrue: [
		| aCachedCanvas |
		session := Smalltalk session.
		aCachedCanvas := aCanvas similar: self boundsInWindow extent ceiling asIntegerPoint.
		aCachedCanvas transform during: [ :aTransform |
			aTransform scaleBy: self space windowScale.
			aTransform apply.
			super drawMeAndChildrenOnSpartaCanvas: aCachedCanvas ].

		cachedSurface := aCachedCanvas surface.
		aCachedCanvas release ].

	aCanvas transform during: [ :aTransform |
			aTransform scaleBy: 1.0 / self space windowScale.
			aTransform apply.
			aCanvas fill
				paint: cachedSurface;
				path: cachedSurface bounds;
				draw ]