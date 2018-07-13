hooks - text modifications
onStringInserted: aBrTextStringInserted
	"Is sent after a string is inserted in a text model"

	self segmentBuilder
		insertedString: aBrTextStringInserted string
		at: aBrTextStringInserted index
		in: self.

	self styleText.

	self
		notifyInserted: (aBrTextStringInserted string asRopedText)
		at: aBrTextStringInserted index