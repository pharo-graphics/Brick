event management
when: aRequestClass reply: aBlock
	self when: aRequestClass do: [ :aRequest |
		| anEvent |
		anEvent := aBlock cull: self.
		anEvent source: self.
		aRequest source dispatchEvent: anEvent ]