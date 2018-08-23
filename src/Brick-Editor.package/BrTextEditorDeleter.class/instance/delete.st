api - processing
delete
	"Perform deletion operation"

	shouldUpdateCursor
		ifTrue: [ self updateCursor ].

	shouldUpdateSelection
		ifTrue: [ self updateSelection ].

	deletionIntervals reverseDo: [ :aMonotoneSelection | self delete: aMonotoneSelection from to: aMonotoneSelection to ]