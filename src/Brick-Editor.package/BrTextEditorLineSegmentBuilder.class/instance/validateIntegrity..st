private
validateIntegrity: anEditor
	| anIntegrity |
	
	Bloc debugModeEnabled
		ifFalse: [ ^ self ].
	
	anIntegrity := self validateSegmentsIn: anEditor.
	self
		assert: [ anIntegrity key ]
		description: [ anIntegrity value key ].