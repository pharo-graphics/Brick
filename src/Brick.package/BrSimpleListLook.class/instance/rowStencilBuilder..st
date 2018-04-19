accessing
rowStencilBuilder: aStencilBuilder
	"aStencilBuilder is expected to be a subclass of BrListRowStencil or a valuable"
	rowStencilBuilder := aStencilBuilder asStencilBuilder: BrListRowStencilBuilder.

	listElement dataSource rowStencilBuilder: rowStencilBuilder