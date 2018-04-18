examples - list
createMaterialSimpleListUsingBlock
	<gtExample>
	| aStencil aList |

	aStencil := [ BrSimpleList new ] asStencil.

	aList := aStencil create.
	aList display: (1 to: 100).

	^ aList