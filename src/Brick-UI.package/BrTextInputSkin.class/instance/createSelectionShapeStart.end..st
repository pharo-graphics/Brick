initialization
createSelectionShapeStart: startPoint end: endPoint
	^ (BlRectangle extent: endPoint - startPoint) asElement
		managed: false;
		zIndex: 0;
		position: startPoint;
		background: widget highlightColor;
		yourself