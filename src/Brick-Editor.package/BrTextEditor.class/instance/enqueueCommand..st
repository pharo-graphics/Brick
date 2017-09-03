commands - processing
enqueueCommand: aBrTextEditorInsertCommand
	commandMutex critical: [ aBrTextEditorInsertCommand executeOn: self ]