accessing
disabled
	^ disabled ifNil: [ disabled := self class new ]