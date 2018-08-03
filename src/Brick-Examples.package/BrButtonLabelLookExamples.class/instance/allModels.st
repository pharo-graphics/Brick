example - instance creation
allModels
	<gtExample>
	
	| aModel |
	aModel := self buttonModel + self labelModel + self iconModel.
	self assert: aModel widgetModels size equals: 2.
	^ aModel