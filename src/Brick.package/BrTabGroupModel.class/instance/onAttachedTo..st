hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	"answer if somebody is interested in what tabs I have"
	self when: BrTabsRequest reply: [ BrTabsChangedEvent tabs: self tabs ].

	anElement when: BrTabSelectedRequest do: [ :aRequest |
		self hasSelectedTab
			ifTrue: [ aRequest source fireEvent: (BrTabSelectedEvent tab: self selectedTab) ] ]