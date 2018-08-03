api - selection
selectPrevious
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to - 1) max: 1) ]