testing
hasNext: aBrTextIterator
	"In case of text we can directly ask iterator if there are any words left"
	<return: #Boolean>

	^ replacedPieces
		ifEmpty: [ aBrTextIterator hasNext ]
		ifNotEmpty: [ true ]