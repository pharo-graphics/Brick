examples - insert
insertFirst: aCharacter command: anInsertCommand
	<gtExample>
	<dependsOn: #insertCharacter>
	<dependsOn: #insertCommand>
	
	^ anInsertCommand
		string: aCharacter asString;
		index: 0