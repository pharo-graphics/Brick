api - insertion
insert: aString atCursorIn: anEditor
	anEditor inserter
		atCursor;
		string: aString;
		insert