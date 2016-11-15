updating
updateChildren
	| children |
	children := OrderedCollection new.
	graphic ifNotNil: [ children add: graphic ].
	(text isEmpty) ifFalse: [ children add: text ].
	children size = 1 ifTrue: [ 
		children first constraints linear horizontal alignCenter.
		children first constraints linear vertical alignCenter ].
	widget removeChildren.
	widget addChildren: children