api - processing
select
	selection do: [ :aMonotoneSelection | self select: aMonotoneSelection from to: aMonotoneSelection to ].
	(shouldUpdateCursor and: [ selection isNotEmpty ])
		ifTrue: [ self updateCursor ]