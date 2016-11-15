initialization
initializeSkin
	systemBar := BrSystemBar new
		space: widget;
		background: (BlBackground fill: Color blue).
	systemBar constraintsDo: [ :c | c linear vertical alignTop.
		c linear horizontal alignCenter ].
	
	widget titleProperty onChangedDo: [ :t | self titleChanged ].
	widget rootProperty onChangedDo: [ :r | self rootChanged ].
	widget borderlessProperty onChangedDo: [ :r | self updateChildren ].
	self rootChanged.
	self initEventHandlers