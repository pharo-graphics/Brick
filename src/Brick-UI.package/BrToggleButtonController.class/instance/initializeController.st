as yet unclassified
initializeController
	super initializeController.
	
	widget selectedProperty onChangedDo: [ :v | 
			v
				ifTrue: [ self activateState: BlSelectedState ]
				ifFalse: [ self deactivateState: BlSelectedState ] ]