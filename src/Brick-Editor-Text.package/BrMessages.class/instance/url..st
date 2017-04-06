accessing
url: anObject
	| csv splitted header children |
	url := anObject.
	
	csv := self url asString asZnUrl retrieveContents.
	splitted := csv splitOn: (String cr , '|' , String lf) asRegex.
	header := splitted first.
	children := splitted allButFirst allButLast.
	
	messages := children collect: [ :each |
		| message |
		message := each splitOn: ','.
		BrMessage new
			sender: message first;
			text: message second;
			date: (Date fromString: message third) ]