as yet unclassified
open
	| animPos animColor |
	animPos := BlNumberTransition new
		from: -300 @ 0;
		to: 0 @ 0;
		duration: 200;
		onStepDo: [ :v | menu relocate: v ].
		
	animColor := BlColorTransition new
		from: (Color black alpha: 0);
		to: (Color black alpha: 0.3);
		duration: 200;
		onStepDo: [ :v | self background: v ].
	BlParallelAnimation new
		add: animPos;
		add: animColor;
		start.
	self visibility: BlVisibility visible