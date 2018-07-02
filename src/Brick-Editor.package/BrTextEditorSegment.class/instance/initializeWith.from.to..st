initialization
initializeWith: aBrText from: aTextStart to: aTextEnd
	"Set a piece of text to be associated with this segment"
	
	text := aBrText.
	textStart := aTextStart.
	textEnd := aTextEnd.
	
	self invalidate