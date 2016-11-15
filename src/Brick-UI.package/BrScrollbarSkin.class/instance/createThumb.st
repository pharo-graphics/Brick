as yet unclassified
createThumb
	^ (BrScrollbarThumb scrollbar: self)
		extent: 10 @ 10;
		background: Color lightGray;
		addEventHandler: (BlEventHandler on:BlDragStartEvent do:[:evt| self thumbDragStart: evt position]);
		addEventHandler: (BlEventHandler on:BlDragEvent do:[:evt| self thumbDragged: evt position])
		yourself