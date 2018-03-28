hooks
onToggleAdded: aBrToggleModel
	
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Added toggle must not be nil' ].
	
	aBrToggleModel beOneWay.
	aBrToggleModel when: BrToggleActivatedEvent do: [ :anEvent | self onToggleActivated: anEvent toggle ].
	aBrToggleModel when: BrToggleDeactivatedEvent do: [ :anEvent | self onToggleDeactivated: anEvent toggle ].
	
	self notifyToggleAdded: aBrToggleModel.
	
	"if user adds a toggle marked as activated we should force activate it"
	aBrToggleModel isActivated
		ifTrue: [ self onToggleActivated: aBrToggleModel ]