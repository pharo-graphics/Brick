initialization
createBox
	^ BrStackPane new
		geometry: BlEllipse new;
		styleClass: #box;
		size: 20 @ 20;
		maxExtent: 20 @ 20;
		minExtent: 20 @ 20
		