examples
exampleButtons
<example>
	| b1 b2 b3 b4 b5 b6 box space b7 |
	
	BrMdTheme load.
	
	b1 := BrButton new 
		text: 'click me!';
		margin:(BlInsets all:5);
		addEventHandler: (BlOnClickHandler do:[:evt| evt target text: 'good job!']).
	
	b2 := BrButton new 
		text: 'cool button',String cr,'with icon';
		addStyleClass: #blue;
		margin:(BlInsets all:5);
		icon: (BrMdIcons checkSvg extent:20@20).
	
	b3 := BrButton new 
		text: 'button outlined';
		addStyleClass: #outlined;
		margin:(BlInsets all:5).
		
	b4 := BrButton new 
		icon: (BrMdIcons checkSvg extent:32@32);
		addStyleClass: #green;
		margin:(BlInsets all:5).	
	
	b5 := BrButton new 
		addStyleClass: #outlined;
		icon: (BrMdIcons checkSvg extent:32@32);
		margin:(BlInsets all:5).
	
	b6 := BrButton new 
		text: 'disabled';
		disabled: true;
		margin:(BlInsets all:5).	
	
	b7 := BrButton new 
		icon:  (BrMdIcons checkSvg extent:32@32);
		margin:(BlInsets all:5);
		geometry: BlEllipse new.	
	
	box := BrHBoxPane new
		layoutDo: [:l| l alignCenter];
		constraintsDo:[:c| 
			c vertical matchParent.
			c horizontal matchParent.];
		addChildren:{b1.b2.b3.b4.b5.b6.b7}.
	
	
	space := BlSpace new.
	space root addChild: box.
	space show