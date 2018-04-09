hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	"answer if somebody is interested in what items I have"
	self when: BrListItemsRequest reply: [ BrListItemsChangedEvent items: self items ]