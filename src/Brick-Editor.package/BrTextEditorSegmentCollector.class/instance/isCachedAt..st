testing
isCachedAt: anIndex
	"Return true if I have a cached segment at a given index, false otherwise"
	<return: #Boolean>

	^ interval rangeIncludes: anIndex