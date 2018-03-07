key bindings
performActionForEvent: anEvent
	(keyBindings keyBindingForEvent: anEvent) ifNotNil: [ :kb | 
			anEvent consumed: true.
			self perform: kb action ]