initialization
createBox
	^ BrStackPane new
		size: 20 @ 20;
		margin: (BlInsets right: 3);
		clipChildren:false;
		styleClass: #box