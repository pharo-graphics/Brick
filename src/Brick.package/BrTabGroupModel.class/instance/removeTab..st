api - tabs
removeTab: aBrTabModel
	| aTabIndex wasSelected |
	
	aTabIndex := self tabs indexOf: aBrTabModel.
	self tabs remove: aBrTabModel.
	
	"we have to deselect removed tab and select a new one before sending tab removed event
	otherwise deselection event will not bubble"
	wasSelected := aBrTabModel isSelected.
	aBrTabModel deselect.
	
	(self isNotEmpty and: [ wasSelected ])
		ifTrue: [ (self tabs at: (aTabIndex min: self tabs size)) select ].

	self onTabRemoved: aBrTabModel at: aTabIndex