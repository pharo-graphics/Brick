api - toggles
removeToggle: aBrToggleModel
	| aToggleIndex |
	
	aToggleIndex := self toggles indexOf: aBrToggleModel.
	self toggles removeAt: aToggleIndex.
	
	"we have to deactivate removed toggle before sending removed event
	otherwise deactivation event will not bubble"
	aBrToggleModel deactivate.

	self onToggleRemoved: aBrToggleModel at: aToggleIndex