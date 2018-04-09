api - adding
column
	"Create and add a new column to the list, return newly created column for further configuration.
	
	Example:
	
	list column
		title: 'Key';
		evaluated: #key.
	list column
		title: 'Value';
		evaluated: #value.
	
	"
	<return: #BrListColumn>
	| aListColumn |
	
	aListColumn := self newColumn.
	self addColumn: aListColumn.
	^ aListColumn