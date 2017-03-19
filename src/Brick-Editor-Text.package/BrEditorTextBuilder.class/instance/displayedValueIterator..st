values - accessing
displayedValueIterator: aBrText
	"In case of text builder a displayed value is BrText which
	should be enumerated with the help of iterator, instead of index"
	<return: #BrTextIterator>

	^ aBrText iterator