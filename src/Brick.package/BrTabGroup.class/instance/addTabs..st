api - adding / removing
addTabs: aCollectionOfElements
	self viewModel addTabs: (aCollectionOfElements collect: [ :anElement | anElement viewModel])