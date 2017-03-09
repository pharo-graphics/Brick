examples
exampleCheckbox
<example>
	| b1 b2 b3 b4 b5 box space|
	
	BrMdTheme load.
	
	b1 := BrCheckbox new 
		text: (BrRopedText string: 'check me');
		margin:(BlInsets all:5).

	b1 checkedProperty onChangedDo: [:v| b1 text: (BrRopedText string: 'i am checked: ', v asString)].
	
	b2 := BrCheckbox new 
		text: (BrRopedText string: 'cb with icon');
		margin:(BlInsets all:5);
		icon: (BrMdIcons closeCircleSvg extent:20@20).
	
	b3 := BrCheckbox new 
		text: (BrRopedText string: 'cb checked');
		checked: true;
		margin:(BlInsets all:5).
	
	b4 := BrCheckbox new 
		text: (BrRopedText string: 'disabled cb');
		disabled: true;
		margin:(BlInsets all:5).	
	
	b5 := BrCheckbox new 
		text: (BrRopedText string: 'indeterminate state');
		indeterminate:true;
		margin:(BlInsets all:5).	
	
	box := BrHBoxPane new
		layoutDo:[:l| l alignCenter];
		constraintsDo:[:c| 
			c horizontal matchParent.
			c vertical matchParent.];
		addChildren: { b1. b2. b3. b4. b5}.
	
	space := BlSpace new.
	space root addChild: box.
	space show