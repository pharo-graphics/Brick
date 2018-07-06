hooks
onStringInserted: aBrTextStringInserted
	"Is sent after a string is inserted in a text model"

	self segmentBuilder
		insertedString: aBrTextStringInserted string
		at: aBrTextStringInserted index
		in: self.

	self segmentBuilder validateIntegrity: self.

	self
		notifyInserted: (BlRopedText string: aBrTextStringInserted string)
		at: aBrTextStringInserted index