examples - insert
insertFirstInEditor: anEditor command: anInsertCommand
	<gtExample>
	<dependsOnClass: #BrTextEditorExamples selector: #editor:methodText:>
	<dependsOn: #insertFirst:command:>

	^ anEditor enqueueCommand: anInsertCommand