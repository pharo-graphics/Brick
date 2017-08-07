accessing
nextPut: aTextEditorSegment
	self
		assert: [ self wantsMore ]
		description: [ 'Stream is full, can not add more!' ].
	
	self
		assert: [ skip >= 0 ]
		description: [ 'Skip count must not be negative' ].
	
	skip isZero
		ifTrue: [ collection add: aTextEditorSegment ]
		ifFalse: [ skip := skip - 1 ]