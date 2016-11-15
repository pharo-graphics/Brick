as yet unclassified
close
|animPos animColor|
	animPos := BlNumberTransition new
		from: 0@0;
		to:-300@0;
		duration:200;
		onStepDo:[:v| menu relocate: v  ].
		
	animColor := BlColorTransition new
		from:(Color black alpha:0.3);
		to:(Color black alpha:0);
		duration:200;
		onStepDo:[:v| self background: v  ];
		onFinishedDo:[self visibility: BlVisibility hidden].
	
	BlParallelAnimation new
		add: animPos;
		add: animColor;
		start
	 