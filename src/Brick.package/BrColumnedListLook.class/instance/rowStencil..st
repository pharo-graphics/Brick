accessing
rowStencil: aStencil
	"aStencil is expected to be a subclass of BrListRowStencil or a valuable"
	rowStencil := aStencil asStencil: BrListRowStencil.

	listElement dataSource rowStencil: rowStencil