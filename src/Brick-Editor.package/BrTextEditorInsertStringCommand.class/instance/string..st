accessing
string: aString

	self
		assert: [ aString isEmpty not ]
		description: [ 'Can not insert an empty string (does not make sense)' ].

	string := aString