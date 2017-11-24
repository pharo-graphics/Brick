private
validateIntegrity: anEditor
	| anIntegrity |
	
	anIntegrity := self validateSegmentsIn: anEditor.
	self
		assert: [ anIntegrity key ]
		description: [ anIntegrity value key ].