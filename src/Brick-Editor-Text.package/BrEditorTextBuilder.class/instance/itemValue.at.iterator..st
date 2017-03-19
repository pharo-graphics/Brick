values - accessing
itemValue: aBrText at: anIndex iterator: aBrTextIterator
	"Items are words within a text line (segment)"
	<return: #BrText>

	^ aBrTextIterator nextWord