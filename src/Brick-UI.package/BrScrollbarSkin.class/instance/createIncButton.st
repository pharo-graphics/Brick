as yet unclassified
createIncButton
	^ self orientation layoutIncButton:(BrScrollbarButton new 
		size: 10 @ 10;
		addEventHandler:
			(BlEventHandler on: BlMouseStillDownEvent
				do: [:evt| self controller incrementButtonPressed: evt ]))