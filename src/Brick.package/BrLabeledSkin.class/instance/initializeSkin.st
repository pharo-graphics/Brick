initialization
initializeSkin
	super initializeSkin.

	text := BlTextElement new
	 	styleClass: #text;
		zIndex: 20.
	text constraintsDo: [ :c |
		c margin: (BlInsets all: 6) ].
	
	widget constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].

	widget textProperty onChangedDo: [ self textChanged ].
	widget iconProperty onChangedDo: [ self graphicChanged ].
	widget fontFamilyProperty onChangedDo: [ self fontChanged ].
	widget fontSizeProperty onChangedDo: [ self fontChanged ].
	widget fontColorProperty onChangedDo: [ self fontChanged ]