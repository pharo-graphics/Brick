accessing - cache
cachedAt: anIndex
	"Return a cached segment at an absolute index within editor
	(I must convert index from editor coordiantes to my local cache coordinates)"
	<return: #BrTextEditorSegment>
	| aCachedIndex |
	
	aCachedIndex := anIndex - interval first + 1.
	^ segments at: aCachedIndex