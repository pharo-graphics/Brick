hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	"answer if somebody is interested in what pages I have"
	self when: BrPagerPagesRequest reply: [ BrPagerPagesChanged pages: self pages ].
	