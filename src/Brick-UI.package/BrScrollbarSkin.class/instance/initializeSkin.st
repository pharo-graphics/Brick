initialization
initializeSkin
	super initializeSkin.
	widget
		styleClass: #scrollbar;
		size: 10@10;
		layout: self orientation defaultLayout.
	self orientation layoutWidget: widget.
	self orientation for: widget length: 10.
	thumb := self createThumb.
	track := self createTrack.
	decrementButton := self createDecButton.
	incrementButton := self createIncButton.
	
	widget scrollValueProperty onChangedDo: [ :v | self positionThumb ].
	widget maxProperty onChangedDo: [ :v | self positionThumb ].
	widget minProperty onChangedDo: [ :v | self positionThumb ].
	widget visibleAmountProperty onChangedDo: [ :v | self positionThumb ].
	widget unitIncrementProperty onChangedDo: [ :v | self positionThumb ].
	widget blockIncrementProperty onChangedDo: [ :v | self positionThumb ].
	widget withButtonsProperty onChangedDo: [ :v | self showButtons: v ]