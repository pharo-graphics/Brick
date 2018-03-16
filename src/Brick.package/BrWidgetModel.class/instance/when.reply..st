event management
when: aRequestClass reply: aBlock
	self when: aRequestClass do: [ :aRequest | aRequest source dispatchEvent: (aBlock cull: self) ]