as yet unclassified
createBox
	^ BrStackPane new
		geometry: BlEllipse new;
		styleClass: #box;
		extent: 20 @ 20;
		maxExtent: 20 @ 20;
		minExtent: 20 @ 20
		