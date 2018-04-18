examples - list
createMaterialSimpleListUsingStencil
	<gtExample>
	| aStencil aList |

	aStencil := self materialSimpleListStencil.

	aList := aStencil create.
	aList display: (1 to: 100).

	^ aList