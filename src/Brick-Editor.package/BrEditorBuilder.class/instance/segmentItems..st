builder - enumeration
segmentItems: aSegmentValue
	"Return a collection of items within a given segment value.
	For example if original entity is a two dimensional matrix (4x4) a segment would be
	a row, while segment's items are its column values"
	<return: #SequenceableCollection of: #Object>

	^ Array streamContents: [ :aStream |
		| aSegmentValueIterator anItemIndex |

		aSegmentValueIterator := self segmentValueIterator: aSegmentValue.

		anItemIndex := 1.
		[ self hasItemValue: aSegmentValue at: anItemIndex iterator: aSegmentValueIterator ] whileTrue: [ 
			aStream nextPut: (self itemValue: aSegmentValue at: anItemIndex iterator: aSegmentValueIterator).
			anItemIndex := anItemIndex + 1 ] ]