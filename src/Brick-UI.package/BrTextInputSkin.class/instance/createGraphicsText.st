initialization
createGraphicsText
	^ BlText new
		styleClass: #text;
		margin:(BlInsets all:1);
		textModel: widget textModel