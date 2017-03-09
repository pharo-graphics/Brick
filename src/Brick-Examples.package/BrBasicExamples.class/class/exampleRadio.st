examples
exampleRadio
<example>
	| b1 b2 b3 b4 grp box space|
	
	BrMdTheme load.

	grp := BrToggleGroup new.
	
	b1 := BrRadioButton new
		text: (BrRopedText string: 'select me');
		margin:(BlInsets all:5);
		group: grp.

	b1 selectedProperty onChangedDo: [:v| b1 text: (BrRopedText string: 'i am selected: ', v asString)].
	
	b2 := BrRadioButton new 
		text: (BrRopedText string: 'cb with icon');
		margin:(BlInsets all:5);
		group: grp;
		icon: (BrMdIcons closeCircleSvg extent:20@20).
	
	b3 := BrRadioButton new 
		text: (BrRopedText string: 'cb checked');
		group: grp;
		selected: true;
		margin:(BlInsets all:5).
	
	b4 := BrRadioButton new 
		text: (BrRopedText string: 'radio disabled');
		group: grp;
		disabled: true;
		margin:(BlInsets all:5).
	
	box := BrHBoxPane new
		layoutDo:[:l| l alignCenter];
		constraintsDo:[:c|
			 c horizontal matchParent.
			 c vertical matchParent ];
		addChildren:{b1. b2. b3. b4}.
	
	space := BlSpace new.
	space root addChild: box.
	space show