api - modification
insertAtCursor: aString
	"Insert a given string at a cursor position deleting currently selected text"

	self inserter
		atCursor;
		string: aString;
		insert