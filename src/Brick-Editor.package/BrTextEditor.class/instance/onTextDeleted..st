hooks - text modifications
onTextDeleted: aBlTextDeleted
	"Is sent after a piece of text was deleted in a text model"

	self segmentBuilder
		deletedFrom: aBlTextDeleted fromIndex
		to: aBlTextDeleted toIndex
		in: self.

	self styleText.
	
	self
		notifyDeletedFrom: aBlTextDeleted fromIndex
		to: aBlTextDeleted toIndex