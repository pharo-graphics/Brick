accessing
stencil: aBrStencilBuilder
	self flag: 'Alex: [it] would make sense to discuss the use of stencil in `BrToolbarItemModel`. I think it is not necessary because that model is bound to the corresponding element anyway. We should see'.
	contentStencilBuilder := aBrStencilBuilder asStencilBuilder.
	self notifyContentChanged.