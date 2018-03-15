hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	"answer if somebody is interested in what tabs I have"
	anElement when: BrTabsRequest do: [ :aRequest | aRequest source fireEvent: (BrTabsChangedEvent tabs: self tabs) ].
	anElement when: BrTabSelectedRequest do: [ :aRequest |
		self hasSelectedTab
			ifTrue: [ aRequest source fireEvent: (BrTabSelectedEvent tab: self selectedTab) ] ]