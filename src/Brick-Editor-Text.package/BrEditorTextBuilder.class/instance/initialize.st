initialization
initialize
	super initialize.
	
	itemBlock := [ BrEditorTextPieceElement new ].
	bindBlock := [ :aTextElement :aBrText | aTextElement text: aBrText ].

	segmentsBlock := #nextLine.
	segmentsIteratorBlock := #iterator.
	segmentsIteratorWhileBlock := #hasNext.
	
	itemsBlock := #nextWord.
	itemsIteratorBlock := #iterator.
	itemsIteratorWhileBlock := #hasNext