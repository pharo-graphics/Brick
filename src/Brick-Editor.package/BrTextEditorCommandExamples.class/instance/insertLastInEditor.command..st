examples - insert
insertLastInEditor: anEditor command: anInsertCommand
	<gtExample>
	<dependsOnClass: #BrTextEditorExamples selector: #editor:methodText:>
	<dependsOn: #insertLast:command:>

	anInsertCommand index: anEditor text size.

	^ anEditor enqueueCommand: anInsertCommand