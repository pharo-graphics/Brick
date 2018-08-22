hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.
	"answer if somebody is interested in what tabs I have"
	self 
		when: BrProgressStatusRequest 
		reply: [ BrProgressChangedEvent amount: self amount total: self total ].