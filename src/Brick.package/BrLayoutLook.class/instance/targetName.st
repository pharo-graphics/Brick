accessing
targetName
	<return: #Symbol>
	
	self
		assert: [ self hasTargetName ]
		description: [ 'Can not access target name if it is not set' ].

	^ targetName