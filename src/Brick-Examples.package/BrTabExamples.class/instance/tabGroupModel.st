instance creation
tabGroupModel
	<gtExample>
	| aTabGroup |

	aTabGroup := BrTabGroupModel new.
	self assert: aTabGroup isEmpty.
	self assert: aTabGroup hasSelectedTab not.
	
	^ aTabGroup