builder - items
hasItemValue: aBrText at: anIndex iterator: aBrTextIterator
	"In case of text we can directly ask iterator if there are any words left"
	<return: #Boolean>

	^ aBrTextIterator hasNext