initialization
initialize
	super initialize.
	
	looks := OrderedCollection new.
	eventDispatcher := BlDirectEventDispatcher on: self.
	postInitializedBlock := [  ]