private
computeSelection: aSelection afterInserted: aText at: anInsertionIndex
	<return: #BlSelection>

	aSelection to <= anInsertionIndex
		ifTrue: [ ^ aSelection ].

	aSelection from >= anInsertionIndex
		ifTrue: [ ^ BlSelection
			from: aSelection from + aText size
			to: aSelection to + aText size ].

	^ BlSelection
		from: aSelection from
		to: aSelection to + aText size