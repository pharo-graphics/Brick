as yet unclassified
addToggle: aToggle
	aToggle selectedProperty
		onChangedDo: [ :v | 
			v
				ifTrue: [ self selectToggle: aToggle ] ].
	self toggles add: aToggle