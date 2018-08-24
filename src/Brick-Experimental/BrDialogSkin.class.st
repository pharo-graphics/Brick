Class {
	#name : #BrDialogSkin,
	#superclass : #BrSkin,
	#instVars : [
		'text',
		'textBox',
		'btnBar',
		'closeBtn'
	],
	#category : 'Brick-Experimental-Dialog'
}

{ #category : #'as yet unclassified' }
BrDialogSkin >> defaultLayout [
^ BlFrameLayout new
]

{ #category : #initialization }
BrDialogSkin >> initializeSkin [
	super initializeSkin.
	widget constraints horizontal matchParent.
	widget constraints vertical matchParent.
	widget background: (BlBackground paint: Color white).
	text := BrLabel new
		fontColor: Color black;
		fontSize: 11;
		text: (BrRopedText string: 'Lorem ipsum dolor sit amet,',String cr,'consectetur adipiscing elit.',String cr,
		'Curabitur eget risus feugiat,',String cr,'mattis odio vitae, efficitur est.',String cr,
		'In rutrum efficitur orci at tristique.',String cr,'Aliquam at imperdiet massa. ');
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
		text: (BrRopedText string: 'CLOSE');
		constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c linear horizontal alignRight ];
		addEventHandler: (BrOnClickHandler do:[:e| widget space close])
]

{ #category : #'as yet unclassified' }
BrDialogSkin >> updateChildren [

	btnBar addChildren: {closeBtn }.
	widget addChildren: {textBox. btnBar}
]
