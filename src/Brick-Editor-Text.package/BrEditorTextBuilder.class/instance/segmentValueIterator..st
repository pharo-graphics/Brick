values - accessing
segmentValueIterator: aBrText
	"Return an object playing a role of an iterator (it may be a collection
	or an actual iterator, or simply an object itself) over a segment value.
	aSegmentValue is a transformed object (displayed value)"
	<return: #BrTextIterator>

	^ aBrText iterator