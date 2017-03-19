values - accessing
segmentValue: aBrText at: anIndex iterator: aBrTextIterator
	"In case of a text we split it in a segments based on lines with the help of iterator"
	<return: #BrText>

	^ aBrTextIterator nextLine