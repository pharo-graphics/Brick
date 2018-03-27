private
targetElement
	<return: #BlElement>

	self hasTargetName
		ifFalse: [ ^ self widget ].

	^ self widget
		childNamed: self targetName
		ifFound: [ :anElement | anElement ]
		ifNone: [ self error: 'Look target named #', self targetName asString, ' is not found!' ]