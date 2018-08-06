instance creation
singleCursor
	<gtExample>
	| aCursor |

	aCursor := BrTextEditorSingleCursor new.
	self assert: aCursor position equals: 0.
	self assert: aCursor isVisible not.
	
	^ aCursor