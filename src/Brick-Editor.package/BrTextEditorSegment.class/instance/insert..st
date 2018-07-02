api - operations
insert: aCollectionOfSegments
	| theSegments theRestLength |
	<return: #Collection of: #BrTextEditorSegment>

	theSegments := { self }, aCollectionOfSegments allButFirst.

	theRestLength := self textLength - (aCollectionOfSegments first textStart - textStart).

	"when inserting multiple segments we just need to alter intervals of the first (myself)
	and the last inserted segments accordingly"
	self
		start: self textStart
		end: aCollectionOfSegments first textEnd.

	theSegments last
		start: theSegments last textStart
		end: theSegments last textEnd + theRestLength.

	^ theSegments