examples - list label
createCustomTextListLabel
	<gtExample>	
	| aStencil anElement |
	
	aStencil := self listLabelStencil.
	aStencil text: 'Custom label'.
	anElement := aStencil create.
	
	self assert: anElement text asString equals: 'Custom label'.
	self assert: anElement margin equals: (BlInsets all: 3).
	self assert: anElement constraints horizontal resizer isMatchParent.
	self assert: anElement constraints vertical resizer isFitContent.
	
	^ anElement