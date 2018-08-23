private
computeCursorMovement: aCursor
	"Cumpute by how much a given cursor should be moved after text deletion within current deletion intervals"
	| aCursorDelta |

	aCursorDelta := 0.

	deletionIntervals do: [ :aMonotoneSelection |
		(aMonotoneSelection to <= aCursor position)
			ifTrue: [ aCursorDelta := aCursorDelta - (aMonotoneSelection to - aMonotoneSelection from) ]
			ifFalse: [ aMonotoneSelection from < aCursor position
				ifTrue: [ aCursorDelta := aCursorDelta - (aCursor position - aMonotoneSelection from) ] ] ].

	^ aCursorDelta