initialization
initializeSkin
	
	super initializeSkin.
	ripple := (BlEllipse diameter: 30) asElement
		styleClass: #ripple;
		managed: false;
		position:10@10;
		background:(Color white alpha:0) asBlBackground.
		
	rippleAnimation := BlScaleAnimation new
		target: ripple; duration:2800; scaleToX: 10; scaleToY: 10;
		yourself.
	
	
	