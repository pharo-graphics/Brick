as yet unclassified
createViewport
	^ BrScrollPaneViewport new
		background: Color veryLightGray;
		constraintsDo: [ :c | 
			c frame vertical alignTop.
			c frame horizontal alignLeft];
		margin:(BlInsets top: 0 right: 10 bottom: 10 left: 0);
		addEventHandler:
			(BlEventHandler on: BlScrollEvent
				do: [ :evt | self contentMouseWheel: evt ])