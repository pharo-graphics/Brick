as yet unclassified
initEventHandlers
	|dragOffset|
	systemBar addEventHandler: 
		(BlEventHandler on: BlDragStartEvent do: [ :evt | 
			evt consumed: true.
			dragOffset := (widget space virtualScreenPositionForEvent:evt) - widget windowPosition.
			]).
				
	systemBar addEventHandler: 
		(BlEventHandler on: BlDragEvent do: [ :evt | 
			evt consumed: true.
			widget windowPosition: (widget space virtualScreenPositionForEvent:evt) - dragOffset.
			])