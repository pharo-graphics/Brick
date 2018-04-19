accessing
rowStencilBuilder: aStencil
	"aStencil is expected to be a subclass of BrListRowStencil or a valuable"
	rowStencil := aStencil asStencil: BrListRowStencilBuilder.

	listElement dataSource rowStencilBuilder: rowStencil