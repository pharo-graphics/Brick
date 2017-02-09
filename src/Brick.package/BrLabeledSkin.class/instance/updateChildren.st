updating
updateChildren
	| children |
	
	children := OrderedCollection new.
	graphic ifNotNil: [ children add: graphic ].

	children add: text.
	widget removeChildren.
	widget addChildren: children