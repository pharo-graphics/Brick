accessing
index
	"Return segment index within BrEditor.
	Note: index can not be nil"
	<return: #Number>
	
	self
		assert: [ index isNotNil ]
		description: [ 'Index can not be nil' ].

	^ index