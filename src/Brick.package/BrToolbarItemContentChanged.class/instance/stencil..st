accessing
stencil: aBrStencilBuilder
	self
		assert: [ aBrStencilBuilder notNil ]
		description: [ 'Content stencil builder must be non-nil' ].

	stencil := aBrStencilBuilder