as yet unclassified
initialize
	super initialize.
	self
		constraintsDo: [ :c |  
			c horizontal matchParent.
			c vertical matchParent.
			c frame vertical alignTop.
			c frame horizontal alignLeft ];
		background: (Color black alpha: 0.3);
		zIndex: 1000;
		visibility: BlVisibility hidden;
		addEventHandler: (BrOnClickHandler do:[self close]).
		
	menu := BrPane new
		width: 300;
		background: Color white;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c frame vertical alignTop.
			c frame horizontal alignLeft  ];
		effect:
			(BlDropShadowEffect new
				offset: 0.5 @ 0;
				width: 3;
				color: (Color black alpha: 0.5)).
	self addChild: menu