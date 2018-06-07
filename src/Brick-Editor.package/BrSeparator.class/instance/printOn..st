printing
printOn: aStream
	self text do: [ :aCharacter | aStream store: aCharacter ]