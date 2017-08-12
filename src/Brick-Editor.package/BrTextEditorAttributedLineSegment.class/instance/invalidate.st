pieces - computation
invalidate
	"Clear all caches and make this segment fresh as if it would just be created and initalized"
	super invalidate.

	pieces := nil.
	replacedPieces := Stack new