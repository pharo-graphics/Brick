as yet unclassified
createTrack
	^ self orientation layoutTrack: (BlElement new
		styleClass: #track;
		border: (BlBorder color: Color lightGray width:1);
		addEventHandler: (BlEventHandler on:BlScrollEvent do:[:evt| self trackMouseWheel: evt]);
		addEventHandler: (BlEventHandler on:BlMouseStillDownEvent do:[:evt| self trackMouseDown: evt]);
		yourself)