printing
printOn: aStream
	self selectors
		withIndexDo: [ :s :i | 
			aStream print: s.
			i < self selectors size ifTrue:[
					aStream space; print: (self relationships at: i) ] ]