initialization
initialize
	super initialize.

	eventDispatcher := BlDirectEventDispatcher on: self.
	actors := OrderedCollection new