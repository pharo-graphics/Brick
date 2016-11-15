as yet unclassified
createIncButton
	^ self orientation layoutIncButton:(BrScrollbarButton new 
		extent: 10 @ 10;
		addEventHandler:
			(BlEventHandler on: BlMouseStillDownEvent
				do: [:evt| self controller incrementButtonPressed: evt ]))