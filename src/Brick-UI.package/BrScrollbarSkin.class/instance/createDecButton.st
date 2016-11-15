as yet unclassified
createDecButton
	^ self orientation layoutDecButton: (BrScrollbarButton new
		extent: 10 @ 10;
		addEventHandler:
			(BlEventHandler on: BlMouseStillDownEvent
				do: [:evt| self controller decrementButtonPressed: evt ]))