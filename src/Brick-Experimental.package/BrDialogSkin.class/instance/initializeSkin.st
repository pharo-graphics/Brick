as yet unclassified
initializeSkin
	super initializeSkin.
	widget constraints horizontal matchParent.
	widget constraints vertical matchParent.
	widget background: (BlBackground fill: Color white).
	text := BrLabel new
		fontColor: Color black;
		fontSize: 11;
		text: 'Lorem ipsum dolor sit amet,',String cr,'consectetur adipiscing elit.',String cr,
		'Curabitur eget risus feugiat,',String cr,'mattis odio vitae, efficitur est.',String cr,
		'In rutrum efficitur orci at tristique.',String cr,'Aliquam at imperdiet massa. ';
		constraintsDo: [ :c| 
			c frame horizontal alignCenter.
			c frame vertical alignCenter. ].
	
	textBox := BrStackPane new 
		addChild: text;
		margin: (BlInsets bottom: 80);
		constraintsDo: [ :c |  
			c horizontal matchParent.
			c vertical matchParent.].
	
	btnBar := BrVBoxPane new
		margin: (BlInsets right: 30 );
		 constraintsDo: [ :c | 
			c horizontal matchParent.
			c frame vertical alignBottom ].
		
	closeBtn := BrButton new
		text: 'CLOSE';
		constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c linear horizontal alignRight ];
		addEventHandler: (BlOnClickHandler do:[:e| widget space close])