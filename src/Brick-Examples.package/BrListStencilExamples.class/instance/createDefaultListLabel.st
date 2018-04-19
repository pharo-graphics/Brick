examples - list label
createDefaultListLabel
	<gtExample>	
	| aStencil anElement |
	
	aStencil := self listLabelStencil.
	anElement := aStencil create.
	
	self assert: anElement text asString equals: 'Label'.
	self assert: anElement margin equals: (BlInsets all: 3).
	self assert: anElement constraints horizontal resizer isMatchParent.
	self assert: anElement constraints vertical resizer isFitContent.
	
	^ anElement