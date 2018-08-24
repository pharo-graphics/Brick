private
computeIndexMovement: anIndex
	"Compute by how much a given text index should be moved after text deletion within current deletion intervals"
	| aCursorDelta |

	aCursorDelta := 0.

	deletionIntervals do: [ :aMonotoneSelection |
		(aMonotoneSelection to <= anIndex)
			ifTrue: [ aCursorDelta := aCursorDelta - (aMonotoneSelection to - aMonotoneSelection from) ]
			ifFalse: [ aMonotoneSelection from < anIndex
				ifTrue: [ aCursorDelta := aCursorDelta - (anIndex - aMonotoneSelection from) ] ] ].

	^ aCursorDelta