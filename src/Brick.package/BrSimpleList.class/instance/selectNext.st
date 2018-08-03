api - selection
selectNext
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to + 1) min: self viewModel items size) ]