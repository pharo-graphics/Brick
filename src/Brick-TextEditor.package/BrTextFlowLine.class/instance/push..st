private
push: anElement
	"Push pushes given element to the end of element's collection
	and update my geometry properties taking new element into account "

	elements addLast: anElement.

	width := width + (anElement measuredWidth + anElement margin width).
	height := height max: (anElement measuredHeight + anElement margin height).
	availableWidth := maxWidth - width