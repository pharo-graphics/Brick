initialization
initializeSkin
	super initializeSkin.
	
	ripple := (BlEllipse diameter: 30) asElement
		styleClass: #ripple;
		managed: false;
		position: 10@10.

	rippleAnimation := (BlTransformAnimation scale: 10@10)
		target: ripple;
		duration: 2800;
		yourself
	
	
	