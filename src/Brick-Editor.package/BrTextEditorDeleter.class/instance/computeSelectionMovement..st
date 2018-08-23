private
computeSelectionMovement: aMonotoneSelection
	"Cumpute by how much a given selection should be moved after text deletion within current deletion intervals.
	Note: a given monotone selection must not overlap with any deletion intervals"
	| aSelectionDelta |
	
	aSelectionDelta := 0.
	
	deletionIntervals do: [ :eachDeletion |
		| size |
		size := eachDeletion to - eachDeletion from.
		eachDeletion to <= aMonotoneSelection from
			ifTrue: [ aSelectionDelta := aSelectionDelta - size  ] ].

	^ aSelectionDelta