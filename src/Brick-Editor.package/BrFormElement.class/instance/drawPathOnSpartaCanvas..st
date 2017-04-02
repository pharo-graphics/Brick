drawing
drawPathOnSpartaCanvas: aCanvas
	super drawPathOnSpartaCanvas: aCanvas.
	
	aCanvas fill
		paint: self form;
		path: self boundsInLocal;
		draw