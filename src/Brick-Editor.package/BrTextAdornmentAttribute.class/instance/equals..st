comparing
equals: aTextAttribute
	^ aTextAttribute class = self class
		and: [ aTextAttribute identityHash = self identityHash ]