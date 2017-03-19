initialization
initialize
	super initialize.
	
	itemElementBlock := [ BrEditorTextPieceElement new ].
	bindBlock := [ :aTextElement :aBrText | aTextElement text: aBrText ]