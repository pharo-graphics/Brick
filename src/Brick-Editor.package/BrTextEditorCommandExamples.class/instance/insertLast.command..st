examples - insert
insertLast: aCharacter command: anInsertCommand
	<gtExample>
	<dependsOn: #insertCharacter>
	<dependsOn: #insertCommand>
	
	^ anInsertCommand
		"we will initialize index when we know the text size"
		string: aCharacter asString