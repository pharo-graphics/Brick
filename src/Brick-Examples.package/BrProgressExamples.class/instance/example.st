element
example
	<gtExample>
	| aContainer aProgressElement aPercentage |
	aContainer := self container.
	aProgressElement := self progress.
	aPercentage := aProgressElement viewModel percentage.
	aContainer 
		look: BrLayoutLook linearHorizontal;
		background: Color transparent;
		addChild: aProgressElement;
		addChild: (BrButton new 
			look: BrLabelLook; 
			label: 'minus'; 
			action: [ 
				aPercentage := (aPercentage - 10) max: 0. 
				aProgressElement viewModel percentage: aPercentage ]);
		addChild: (BrButton new 
			look: BrLabelLook; 
			label: 'plus'; 
			action: [ 
				aPercentage := (aPercentage + 10) min: 100. 
				aProgressElement viewModel percentage: aPercentage ]).
	^ aContainer