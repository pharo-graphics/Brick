as yet unclassified
exampleButtonsStartStopMorphic
<example>
	| b1 b2  box space|
	
	BrMdTheme load.
	
	b1 := BrButton new 
		text: 'start morphic';
		margin:(BlInsets all:5);
		constraintsDo:[:c| c alignCenter];
		addEventHandler: (BlOnClickHandler do:[:evt| MorphicUIManager default installAsDefault.]).
	
	b2 := BrButton new 
		text: 'stop morphic';
		margin:(BlInsets all:5);
		constraintsDo:[:c| c alignCenter];
		addEventHandler: (BlOnClickHandler do:[:evt| MorphicUIManager default terminateUIProcess]).
	

	
	box := BrHBoxPane new
		constraintsDo:[:c| c vhMatchParent ; alignCenter];
		addChildren:{b1.b2}.
	
	space := BlSpace new.
	space root addChild: box.
	space show