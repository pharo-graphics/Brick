values - accessing
displayedValueIterator: aDisplayedValue
	"Return an object playing a role of an iterator (it may be a collection
	or an actual iterator, or simply an object itself) used to iterate over
	a displayed value in order to split it into a segments.
	aDisplayedValue is a transformed object (displayed value)"
	<return: #Object>

	^ aDisplayedValue