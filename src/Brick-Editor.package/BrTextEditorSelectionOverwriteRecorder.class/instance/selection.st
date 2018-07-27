selection
selection
	<return: #BlSelection>

	^ compositeSelection isEmpty
		ifTrue: [ BlSelection empty ]
		ifFalse: [ BlMonotoneSelection from: compositeSelection from to: compositeSelection to ]