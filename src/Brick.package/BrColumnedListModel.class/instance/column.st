api - adding
column
	"Create and add a new column to the list, return newly created column for further configuration.
	
	Example:
	
	list column
		title: 'Key';
		stencil: #key.
	list column
		title: 'Value';
		stencil: #value.
	
	"
	<return: #BrListColumn>
	| aListColumn |
	
	aListColumn := self newColumn.
	self addColumn: aListColumn.
	^ aListColumn