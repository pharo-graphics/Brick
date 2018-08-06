api - text modifications
delete: aFromIndex to: aToIndex in: aBrTextEditor
	"Delete text within a given interval updating cursor position.
	Note: I do not change selection"

	aBrTextEditor
		delete: aFromIndex
		to: aToIndex.

	self position <= aFromIndex
		ifTrue: [ ^ self ].

	self position >= aToIndex
		ifTrue: [ ^ self moveLeftBy: aToIndex - aFromIndex in: aBrTextEditor ].

	self moveLeftBy: self position - aFromIndex in: aBrTextEditor