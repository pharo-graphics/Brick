accessing
targetName: aSymbolicName

	self
		assert: [ self hasTargetName not ]
		description: [ 'Target can not be changed' ].

	self
		assert: [ self isAttachedToWidget not ]
		description: [ 'Target can not be set once look is bound to a widget' ].

	targetName := aSymbolicName