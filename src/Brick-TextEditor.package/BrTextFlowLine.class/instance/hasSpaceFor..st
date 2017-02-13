testing
hasSpaceFor: anElement
	"Return true if I am able to provide space for a given element.
	By convention I always allow element to take space if I am empty
	regardless of actual available space"
	<return: #Boolean>
	
	^ self isEmpty or: [
		availableWidth >= (anElement measuredWidth + anElement margin width) ]