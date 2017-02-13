initialization
releaseCaches

	cachedSurface ifNotNil: #release.
	cachedSurface := nil