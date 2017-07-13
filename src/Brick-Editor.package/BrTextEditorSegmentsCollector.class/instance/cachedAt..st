cache - accessing
cachedAt: anIndex
	"Return a cached segment at an absolute index within editor
	(I must convert index from editor coordiantes to my local cache coordinates)"
	<return: #BrEditorSegment>
	| aCachedIndex |

	aCachedIndex := anIndex - interval first + 1.
	^ self segments at: aCachedIndex