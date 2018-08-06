initialization
initialize
	super initialize.
	
	cursors := SortedCollection sortBlock: [ :a :b | a position < b position ]