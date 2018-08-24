private
insertString: aString at: aTextIndex
	| aCommand |

	aCommand := BrTextEditorInsertStringCommand new
		string: aString;
		index: aTextIndex.
	self editor enqueueCommand: aCommand