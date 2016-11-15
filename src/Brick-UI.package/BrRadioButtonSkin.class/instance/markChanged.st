as yet unclassified
markChanged
	widget selected
		ifTrue: [ mark visibility: BlVisibility visible ]
		ifFalse: [ mark visibility: BlVisibility hidden ]