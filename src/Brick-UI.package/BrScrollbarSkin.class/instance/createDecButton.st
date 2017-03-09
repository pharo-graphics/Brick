as yet unclassified
createDecButton
	^ self orientation layoutDecButton: (BrScrollbarButton new
		size: 10 @ 10;
		addEventHandler:
			(BlEventHandler on: BlMouseStillDownEvent
				do: [:evt| self controller decrementButtonPressed: evt ]))