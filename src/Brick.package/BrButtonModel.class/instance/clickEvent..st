mouse handlers
clickEvent: anEvent
	anEvent consumed: true.

	self action glamourValueWithArgs: { anEvent currentTarget .  self }