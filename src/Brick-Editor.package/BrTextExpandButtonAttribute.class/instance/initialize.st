initialization
initialize
	super initialize.
	
	self beAppend.
	
	attributesCreatingBlock := [  ].
	isExpanded := false.
	createdAttributes := OrderedCollection new